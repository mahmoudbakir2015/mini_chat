import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/default_text_form.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function that builds a form for signing in.
///
/// This function takes required parameters like [context], [email], [password],
/// [isObscure], and required functions like [onTap], [emailValidate], and
/// [passValidate]. This function returns a [Form] widget that contains a
/// [Column] widget with two [defaultTextForm] widgets and a
/// [buildCustomDivider] widget. The first [defaultTextForm] widget is for
/// entering the email and the second [defaultTextForm] widget is for entering
/// the password. The [buildCustomDivider] widget is used to separate the two
/// [defaultTextForm] widgets. The [onTap] function is used to toggle the
/// [isObscure] parameter of the second [defaultTextForm] widget. The
/// [emailValidate] and [passValidate] functions are used to validate the email
/// and password respectively.
/// ****  a9e7cf95-3ea6-4ec3-828e-8f4742ea2d2a  ******
Form buildSignInForm({
  required BuildContext context,
  required dynamic email,
  required dynamic password,
  required bool isObscure,
  void Function()? onTap,
  required String? Function(String? v)? emailValidate,
  required String? Function(String? v)? passValidate,
}) {
  return Form(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        defaultTextForm(
          label: 'enter your email',
          textInputType: TextInputType.emailAddress,
          controller: email,
          iconData: Icons.email,
          onValidate: emailValidate,
        ),
        buildCustomDivider(context),
        defaultTextForm(
          label: 'enter your password',
          onValidate: passValidate,
          textInputType: TextInputType.text,
          controller: password,
          iconData: Icons.lock,
          obscureText: isObscure,
          onTap: onTap,
          isSuffix: true,
        ),
      ],
    ),
  );
}
