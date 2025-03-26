import "../../../utils/path_provider.dart";

// Widget addProduct({
//   required TextEditingController productName,
//   required TextEditingController productPrice,
// }) {
//   return Container(
//     height: 100,
//     width: 100,
//     decoration: BoxDecoration(color: Colors.white),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 20.0),
//           Text(
//             "Add Products",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 25,
//               decoration: TextDecoration.none,
//             ),
//           ),
//           SizedBox(height: 20.0),
//           textInputField(controller: productName),
//           textInputField(controller: productPrice),
//         ],
//       ),
//     ),
//   );
// }

class AddItemsPage extends StatelessWidget {
  const AddItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder:
          (controller) => WillPopScope(
            onWillPop: () async {
              await controller.fetchProducts(); // Run your async function
              return true; // Then allow pop
            },
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    controller.isEdit ? "Edit Products" : "Add Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),

                      SizedBox(height: 20.0),
                      Text(
                        controller.isEdit
                            ? "Edit Product Name"
                            : "Enter Product Name",
                      ),
                      SizedBox(height: 10.0),
                      textInputField(controller: controller.productName),
                      SizedBox(height: 10.0),
                      Text(
                        controller.isEdit
                            ? "Edit Product Price"
                            : "Enter Product Price",
                      ),
                      SizedBox(height: 10.0),
                      textInputField(controller: controller.productPrice),
                      SizedBox(height: 10.0),
                      Text(
                        controller.isEdit ? "Edit Quantity" : "Enter Quantity",
                      ),
                      SizedBox(height: 10.0),
                      textInputField(controller: controller.productQuantity),
                      SizedBox(height: 10.0),
                      Center(
                        child:
                            controller.isEdit
                                ? buttonField(
                                  onPressed: () async {
                                    final result = await controller.editProduct(
                                      controller.productId,
                                      controller.productName.text,
                                      controller.productPrice.text,
                                      controller.productQuantity.text,
                                    );
                                    controller.clearController();
                                    String response = result["message"];
                                    SnackNotification.success(
                                      message: response,
                                    );
                                  },
                                  input: "EDIT",
                                )
                                : buttonField(
                                  onPressed: () {
                                    final result = controller.addProduct(
                                      controller.productName.text,
                                      controller.productPrice.text,
                                      controller.productQuantity.text,
                                    );
                                    controller.clearController();
                                    SnackNotification.message(
                                      message: result.toString(),
                                    );
                                  },
                                  input: "ADD",
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
