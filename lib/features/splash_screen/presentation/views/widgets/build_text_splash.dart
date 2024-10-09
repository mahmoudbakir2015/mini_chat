import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';

buildTextSplash(BuildContext context) {
  return Column(
    children: [
      const Text(
        'Whats Up',
        style: AppStyles.textBoldBlack_25,
        // TextStyle(
        //   color: Colors.black,
        //   fontWeight: FontWeight.bold,
        //   fontSize: 25,
        // ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      Text(
        'The best chat app for this century',
        style: AppStyles.textBoldBlack_25.copyWith(
          color: AppColor.primaryColor,
          fontSize: 18,
        ),
        // TextStyle(
        //   color: Color(0xff1AAD5C),
        //   fontWeight: FontWeight.bold,
        // ),
      ),
    ],
  );
}
