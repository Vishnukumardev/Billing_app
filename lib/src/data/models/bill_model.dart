import 'package:billing_app/src/data/models/product_list_model.dart';

class BillModel {
  final InvoiceInfoModel info;
  final ProductListModel item;

  const BillModel({required this.item, required this.info});
}

class InvoiceInfoModel {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfoModel({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}
