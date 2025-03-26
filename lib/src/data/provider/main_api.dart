import '../../utils/path_provider.dart';

class MainAPI {
  final Apihelper _apihelper = Get.put(Apihelper());

  List<Map<String, dynamic>> sampleProducts = [
    {
      "id": 1,
      "productName": "Wireless Mouse",
      "price": 25.99,
      "tax": 2.6,
      "quantity": 2,
      "discount": 5.0,
    },
    {
      "id": 2,
      "productName": "Bluetooth Keyboard",
      "price": 45.5,
      "tax": 4.55,
      "quantity": 1,
      "discount": 0.0,
    },
    {
      "id": 3,
      "productName": "USB-C Hub",
      "price": 34.75,
      "tax": 3.47,
      "quantity": 3,
      "discount": 10.0,
    },
    {
      "id": 4,
      "productName": "Laptop Stand",
      "price": 29.99,
      "tax": 3.0,
      "quantity": 1,
      "discount": 2.5,
    },
    {
      "id": 5,
      "productName": "Webcam 1080p",
      "price": 59.95,
      "tax": 5.99,
      "quantity": 2,
      "discount": 7.5,
    },
  ];

  dynamic sampleProduct = '''{
      "id": 1,
      "productName": "Wireless Mouse",
      "price": 25.99,
      "tax": 2.6,
      "quantity": 2,
      "discount": 5.0
}''';

  Future<List<dynamic>> fetchProducts() async {
    final response = await _apihelper.getRequest("endpoint");
    return response;
  }
}
