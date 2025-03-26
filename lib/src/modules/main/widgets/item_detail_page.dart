import '../../../utils/path_provider.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

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
                appBar: AppBar(title: Text("Product Details")),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        "Product Name : ${controller.product.productName}",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Price :  ${controller.product.price}",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Quantity :  ${controller.product.quantity}",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: buttonField(
                          onPressed: () async {
                            final date = DateTime.now();
                            final dueDate = date.add(Duration(days: 7));

                            final bill = BillModel(
                              item: controller.product,
                              info: InvoiceInfoModel(
                                description: "Product Details",
                                number: '${DateTime.now().year}-9999',
                                date: date,
                                dueDate: dueDate,
                              ),
                            );
                            final pdfFile = await BillInvoiceApi.generate(bill);
                            BillApi.openFile(pdfFile);
                          },
                          input: "GENERATE BILL",
                          width: 200,
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
