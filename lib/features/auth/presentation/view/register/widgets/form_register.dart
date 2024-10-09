import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/default_text_form.dart';

Form buildRegisterForm({
  required BuildContext context,
  required dynamic email,
  required dynamic name,
  required dynamic phone,
  required dynamic password,
  required bool isObscure,
  void Function()? onTap,
  required String? Function(String? v)? emailValidate,
  required String? Function(String? v)? passValidate,
  required String? Function(String? v)? nameValidate,
  required String? Function(String? v)? phoneValidate,
}) {
  return Form(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        defaultTextForm(
          label: 'enter your name',
          textInputType: TextInputType.text,
          controller: name,
          iconData: Icons.person,
          onValidate: nameValidate,
        ),
        buildCustomDivider(context),
        defaultTextForm(
          label: 'enter your email',
          textInputType: TextInputType.emailAddress,
          controller: email,
          iconData: Icons.email,
          onValidate: emailValidate,
        ),
        buildCustomDivider(context),
        defaultTextForm(
          label: 'enter your phone',
          textInputType: TextInputType.number,
          controller: phone,
          iconData: Icons.phone,
          onValidate: phoneValidate,
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
