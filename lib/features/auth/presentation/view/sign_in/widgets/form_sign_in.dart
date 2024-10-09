import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/default_text_form.dart';

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
