import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

Row buildFooter(BuildContext context) {
  return Row(
    children: [
      const Text('''Dont't have an account?'''),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {},
        child: const Text(
          'Register here',
          style: TextStyle(
            color: AppColor.primaryColor,
          ),
        ),
      ),
    ],
  );
}
