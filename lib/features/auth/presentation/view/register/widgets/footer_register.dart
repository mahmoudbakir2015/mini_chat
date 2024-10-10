import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/auth/presentation/view/sign_in/sign_in.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A row of text and an InkWell which displays 'Already have an account?',
/// a small space, and 'Login here'. When the InkWell is tapped, the
/// SignIn screen is pushed onto the navigator.
/// ****  80dede56-eff2-45b4-b234-b16007fabced  ******
Row buildRegisterFooter(BuildContext context) {
  return Row(
    children: [
      const Text('''Already have an account?'''),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
          );
        },
        child: const Text(
          'Login here',
          style: TextStyle(
            color: AppColor.primaryColor,
          ),
        ),
      ),
    ],
  );
}
