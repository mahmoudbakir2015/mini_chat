import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/default_text_form.dart';

Form buildProfileForm(TextEditingController name, TextEditingController phone) {
  return Form(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: defaultTextForm(
            label: 'Name',
            controller: name,
            textInputType: TextInputType.text,
            iconData: null,
            onValidate: (String? value) {
              return null;
            },
          ),
        ),
        defaultTextForm(
          label: 'Phone',
          controller: phone,
          textInputType: TextInputType.number,
          iconData: null,
          onValidate: (String? value) {
            return null;
          },
        ),
      ],
    ),
  );
}
