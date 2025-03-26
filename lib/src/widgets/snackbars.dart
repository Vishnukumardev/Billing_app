import 'package:flutter/cupertino.dart';

import '../utils/path_provider.dart';

class SnackNotification {
  static error({message = ''}) {
    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: Colors.red,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.red,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Error"), Text('message')],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static warning({message = ''}) {
    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: Colors.yellow,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.yellowAccent,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Warning"), Text('message')],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static success({message = ''}) {
    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: Colors.green,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.greenAccent,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Success"), Text('message')],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static message({message = ''}) {
    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Success"), Text('message')],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }
}
