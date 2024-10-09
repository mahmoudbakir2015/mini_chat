import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';

SizedBox buildButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.066,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
      ),
      onPressed: () {},
      child: Text(
        'Log In',
        style: AppStyles.textBoldBlack_25.copyWith(
          fontSize: 20,
        ),
      ),
    ),
  );
}
