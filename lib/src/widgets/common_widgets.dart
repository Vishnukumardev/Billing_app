import '../utils/path_provider.dart';

Widget textInputField({
  required TextEditingController controller,
  int maxlength = 100,
  bool? obsureText,
  TextInputType? type,
  // Validator validate = Validator.name,
  String fieldName = "",
  int min = 0,
  int max = 0,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obsureText ?? false,
    maxLength: maxlength,
    showCursor: true,
    cursorColor: Colors.black,
    // validator: (value) {
    //   validation(validate, value!, fieldName, min, max);
    // },
    decoration: InputDecoration(
      counterText: "",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}

Widget buttonField({
  double height = 50.0,
  double width = 100.0,
  double radius = 10,
  Color? color,
  String input = " ",
  required VoidCallback onPressed,
  TextStyle? style,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(radius),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(input, style: TextStyle(color: Colors.black, fontSize: 15)),
    ),
  );
}
