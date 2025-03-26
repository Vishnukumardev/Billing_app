import '../../../utils/path_provider.dart';

void showDeleteDialog({
  required String itemName,
  required VoidCallback onConfirm,
}) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('Delete "$itemName"?'),
      content: Text(
        'Are you sure you want to delete this item? This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // Close dialog
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onConfirm(); // Perform delete action
            Get.back(); // Close dialog after action
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('Delete'),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
