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
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      "\u{20B9}${controller.products[index].price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50.0,
                                child: Center(
                                  child: Text(
                                    controller.products[index].quantity
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Icon(Icons.info),
                                    onTap: () {
                                      controller.fetchProductById(
                                        controller.products[index].id,
                                      );
                                      Get.dialog(
                                        ItemDetailPage(),
                                        barrierDismissible: false,
                                      );
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  InkWell(
                                    onTap: () {
                                      controller.editValues(
                                        controller.products[index].id,
                                        controller.products[index].productName,
                                        controller.products[index].price
                                            .toString(),
                                        controller.products[index].quantity
                                            .toString(),
                                      );
                                      controller.switchEdit();
                                      Get.dialog(AddItemsPage());
                                    },
                                    child: Icon(Icons.edit),
                                  ),
                                  SizedBox(width: 10.0),
                                  InkWell(
                                    onTap: () {
                                      showDeleteDialog(
                                        itemName:
                                            controller
                                                .products[index]
                                                .productName,
                                        onConfirm: () async {
                                          final response = await controller
                                              .deleteProduct(
                                                controller.products[index].id,
                                              );
                                          String message = response["message"];
                                          SnackNotification.success(
                                            message: message,
                                          );
                                          await controller.fetchProducts();
                                        },
                                      );
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
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
