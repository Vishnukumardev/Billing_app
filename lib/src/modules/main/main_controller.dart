import '../../utils/path_provider.dart';

class MainController extends GetxController {
  /// A Separate Class is implemented specifically for the Main Page API
  final MainAPI _mainAPI = MainAPI();

  ///TextEditingController for product,price and quantity showing as well as
  ///updating the database by using it on input fields.
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productQuantity = TextEditingController();

  ///Variable for assigning single or specific product
  ProductListModel product = ProductListModel.empty();

  ///Variable for assigning list of products
  List<ProductListModel> products = [];

  ///boolean variable for switch between Add and Edit Items Page
  bool isEdit = false;

  @override
  void onInit() async {
    // TODO: implement onInit
    ///OnInit is used to make the initial Product List Clear and Hit and api to
    ///product from server
    super.onInit();
    product = ProductListModel.empty();
    products.clear();
    await fetchProducts();
    await fetchProductById();
  }

  ///Method for switching to Add Items Page
  void switchAdd() {
    if (isEdit == true) {
      isEdit = false;
    }
    update();
  }

  ///method for switching to Edit Items Page
  void switchEdit() {
    if (isEdit == false) {
      isEdit = true;
    }
    update();
  }

  ///Future Method for getting products from database
  Future<List<dynamic>> fetchProducts() async {
    products.clear();
    update();
    products =
        _mainAPI.sampleProducts
            .map((item) => ProductListModel.fromJson(item))
            .toList();
    update();
    return products;
  }

  Future<dynamic> fetchProductById() async {
    product = ProductListModel.empty();

    update();
    final Map<String, dynamic> data = jsonDecode(_mainAPI.sampleProduct);
    product = ProductListModel.fromJson(data);
    update();
    return product;
  }
}
