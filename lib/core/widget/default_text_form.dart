import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

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
