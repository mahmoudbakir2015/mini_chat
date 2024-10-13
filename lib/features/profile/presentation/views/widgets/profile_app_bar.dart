import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_styles.dart';

AppBar buildProfileAppBar(BuildContext context) {
  return AppBar(
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    title: const Text(
      'Profile',
      style: AppStyles.textBoldBlack_25,
    ),
  );
}
