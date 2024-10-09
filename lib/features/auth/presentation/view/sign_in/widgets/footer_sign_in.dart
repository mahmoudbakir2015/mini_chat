import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/auth/presentation/view/register/register.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A row widget that contains a text and an InkWell.
/// The text contains a text saying that the user doesn't have an account.
/// The InkWell is used to navigate to the Register screen when the user taps on it.
/// The size of the space between the text and the InkWell is 0.04 times of the device's screen width.
///
/// ****  2df809b0-e405-4f91-bead-094d5a576e4c  ******
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
