import '../../utils/path_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder:
          (controller) => SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text("Product List")),
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "Quantity",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            "Actions",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (controller.products.isEmpty) {
                          return const Center(child: Text("No products found"));
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            final product = controller.products[index];

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Product details
                                SizedBox(
                                  width: 150,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.productName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        "\u{20B9}${product.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Quantity
                                SizedBox(
                                  width: 50.0,
                                  child: Center(
                                    child: Text(
                                      product.quantity.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),

                                // Actions
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.fetchProductById(product.id);
                                        Get.dialog(
                                          ItemDetailPage(),
                                          barrierDismissible: false,
                                        );
                                      },
                                      child: const Icon(Icons.info),
                                    ),
                                    const SizedBox(width: 10.0),
                                    InkWell(
                                      onTap: () {
                                        controller.editValues(
                                          product.id,
                                          product.productName,
                                          product.price.toString(),
                                          product.quantity.toString(),
                                        );
                                        controller.switchEdit();
                                        Get.dialog(AddItemsPage());
                                      },
                                      child: const Icon(Icons.edit),
                                    ),
                                    const SizedBox(width: 10.0),
                                    InkWell(
                                      onTap: () {
                                        showDeleteDialog(
                                          itemName: product.productName,
                                          onConfirm: () async {
                                            final response = await controller
                                                .deleteProduct(product.id);
                                            SnackNotification.success(
                                              message: response["message"],
                                            );
                                            await controller.fetchProducts();
                                          },
                                        );
                                      },
                                      child: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  controller.clearController();
                  controller.switchAdd();
                  Get.dialog(AddItemsPage(), barrierDismissible: false);
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
    );
  }
}
