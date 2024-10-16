import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

SizedBox buildSaveProfileButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.06,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.saveColor,
      ),
      onPressed: () {},
      label: const Text(
        'Save Profile',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(
        Icons.save,
        color: Colors.white,
      ),
    ),
  );
}
