class ProductListModel {
  int id;
  String productName;
  double price;
  double tax;
  int quantity;
  double discount;

  ProductListModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.tax,
    required this.quantity,
    required this.discount,
  });

  factory ProductListModel.empty() {
    return ProductListModel(
      id: 0,
      productName: '',
      price: 0.0,
      tax: 0.0,
      quantity: 0,
      discount: 0.0,
    );
  }

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      productName: json['name'],
      price: (json['price'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      quantity: json['quantity'],
      discount: (json['discount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': productName,
      'price': price,
      'tax': tax,
      'quantity': quantity,
      'discount': discount,
    };
  }
}
