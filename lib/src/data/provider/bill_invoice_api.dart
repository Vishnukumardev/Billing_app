import 'dart:io';

import 'package:billing_app/src/data/models/bill_model.dart';
import 'package:billing_app/src/data/provider/bill_api.dart';
import 'package:billing_app/src/widgets/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class BillInvoiceApi {
  static Future<File> generate(BillModel bill) async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build:
            (context) => [
              buildTitle(bill),
              buildInvoice(bill),
              buildTotal(bill),
              buildFooter(),
            ],
      ),
    );

    return BillApi.saveDocument(name: "Invoice.pdf", pdf: pdf);
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }

  static Widget buildTitle(BillModel bill) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          children: [
            Text(
              "INVOICE",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0.8 * PdfPageFormat.cm),
            Text(bill.info.description),
            SizedBox(height: 0.8 * PdfPageFormat.cm),
          ],
        ),
      ),
      Expanded(child: SizedBox()),
      Expanded(child: buildInvoiceInfo(bill)),
    ],
  );

  static Widget buildInvoiceInfo(BillModel bill) {
    final paymentTerms =
        '${bill.info.dueDate.difference(bill.info.date).inDays}days';
    final titles = <String>[
      "Invoice Number :",
      "Invoice Date :",
      "Payment Date :",
      "Due Date :",
    ];
    final data = <String>[
      bill.info.number,
      Utils.formatDate(bill.info.date),
      paymentTerms,
      Utils.formatDate(bill.info.date),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];
        return buildText(title: title, value: value);
      }),
    );
  }

  static Widget buildInvoice(BillModel bill) {
    final headers = ['Product', 'Date', 'Quantity', 'Discount', 'Tax', 'Total'];
    final product = bill.item;
    final info = bill.info;
    final total = product.price * product.quantity * (1 + product.tax);
    final tableData = [
      [
        product.productName,
        Utils.formatDate(info.date),
        '${product.quantity}',
        '${product.discount} %',
        '\$ ${product.tax} %',
        '\$ t${total.toStringAsFixed(2)}',
      ],
    ];
    return TableHelper.fromTextArray(
      headers: headers,
      data: tableData,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(BillModel bill) {
    final total = bill.item.price * bill.item.quantity * (1 + bill.item.tax);
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                buildText(
                  title: "Total Amount Due",
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Divider(),
      SizedBox(height: 2 * PdfPageFormat.mm),
      SizedBox(height: 1 * PdfPageFormat.mm),
    ],
  );
}
