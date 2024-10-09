import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/auth/presentation/view/register/register.dart';

Row buildSignInFooter(BuildContext context) {
  return Row(
    children: [
      const Text('''Dont't have an account?'''),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        child: const Text(
          'Register here',
          style: TextStyle(
            color: AppColor.btnColor,
          ),
        ),
      ),
    ],
  );
}
