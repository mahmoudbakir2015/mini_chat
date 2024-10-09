import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';

SizedBox buildAuthButton(
    {required BuildContext context, bool isRegister = false}) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.066,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.btnColor,
      ),
      onPressed: () {},
      child: Text(
        isRegister ? 'Sign Up' : 'Log In',
        style: AppStyles.textBoldBlack_25.copyWith(
          fontSize: 20,
        ),
      ),
    ),
  );
}
