import '../../utils/path_provider.dart';

class MainController extends GetxController {
  /// A Separate Class is implemented specifically for the Main Page API
  final MainAPI _mainAPI = MainAPI();

  ///TextEditingController for product,price and quantity showing as well as
  ///updating the database by using it on input fields.
  final productName = TextEditingController();
  final productPrice = TextEditingController();
  final productQuantity = TextEditingController();

  ///Variable for assigning single or specific product
  ProductListModel product = ProductListModel.empty();

  ///Variable for assigning list of products
  List<ProductListModel> products = [];

  ///boolean variable for switch between Add and Edit Items Page
  bool isEdit = false;
  int productId = 0;

  @override
  void onInit() async {
    // TODO: implement onInit
    ///OnInit is used to make the initial Product List Clear and Hit and api to
    ///product from server
    super.onInit();
    product = ProductListModel.empty();
    products.clear();
    await fetchProducts();
  }

  ///Method for switching to Add Items Page
  void switchAdd() {
    if (isEdit == true) {
      isEdit = false;
    }
    update();
  }

  ///method for switching to Edit Items Page
  void switchEdit() async {
    if (isEdit == false) {
      isEdit = true;
    }
    update();
  }

  Future<List<dynamic>> fetchProducts() async {
    products.clear();
    update();

    // Get only the 'results' from API via the provider method
    final resultList = await _mainAPI.fetchProducts();

    products =
        resultList.map((item) => ProductListModel.fromJson(item)).toList();

    update();
    return products;
  }

  Future<dynamic> fetchProductById(int id) async {
    print("id:$id");
    product = ProductListModel.empty();
    update();
    product = ProductListModel.fromJson(await _mainAPI.getProductDetails(id));
    update();
    return product;
  }

  Future<dynamic> addProduct(String name, String price, String quantity) async {
    Map<String, dynamic> product = await _mainAPI.postProduct(
      name,
      price,
      quantity,
    );
    print(product);
    return product;
  }

  Future<dynamic> editProduct(
    int id,
    String name,
    String price,
    String quantity,
  ) async {
    Map<String, dynamic> product = await _mainAPI.updateProduct(
      id,
      name,
      price,
      quantity,
    );
    print(product);
    return product;
  }

  Future<dynamic> deleteProduct(int id) async {
    Map<String, dynamic> product = await _mainAPI.removeProduct(id);
    print(product);
    return product;
  }

  void editValues(int id, String name, String price, String quantity) async {
    clearController();
    productId = 0;
    update();
    productId = id;
    productName.text = name;
    productPrice.text = price;
    productQuantity.text = quantity;
    update();
  }

  void clearController() {
    productQuantity.text = "";
    productName.text = "";
    productPrice.text = "";
    update();
  }
}
