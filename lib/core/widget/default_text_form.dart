import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A TextFormField widget with a custom OutlineInputBorder and a prefixIcon.
///
/// The [label] parameter is the text that is displayed above the text field.
/// The [controller] parameter is the TextEditingController that is used to
/// control the text field.
/// The [obscureText] parameter is a boolean that determines whether the text
/// field is obscured or not. If it is obscured, the text will be replaced with
/// asterisks.
/// The [textInputType] parameter is the TextInputType that is used to
/// determine the type of text input.
/// The [iconData] parameter is the IconData that is used to display the prefix
/// icon.
/// The [isSuffix] parameter is a boolean that determines whether the suffix icon
/// is displayed or not.
/// The [onSubmitted] parameter is a function that is called when the user
/// submits the form.
/// The [onChange] parameter is a function that is called when the user changes
/// the text.
/// The [onValidate] parameter is a function that is called when the user
/// attempts to validate the form.
/// The [onTap] parameter is a function that is called when the user taps on the
/// suffix icon.
/// ****  57ae35b4-ce4f-4052-b8b1-ef9d3307040b  ******
Widget defaultTextForm({
  required String label,
  required TextEditingController controller,
  bool obscureText = false,
  required TextInputType textInputType,
  required IconData iconData,
  bool isSuffix = false,
  void Function(String)? onSubmitted,
  void Function(String)? onChange,
  required String? Function(String?)? onValidate,
  void Function()? onTap,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      validator: onValidate,
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: 2.0,
          ), // Border when focused
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30.0,
          ), // Circular border
        ),
        prefixIcon: Icon(
          iconData,
        ),
        labelText: label,
        suffixIcon: isSuffix
            ? GestureDetector(
                onTap: onTap,
                child: obscureText
                    ? const Icon(
                        Icons.visibility_off,
                      )
                    : const Icon(
                        Icons.visibility,
                      ),
              )
            : null,
      ),
    );
void navigateTo({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
