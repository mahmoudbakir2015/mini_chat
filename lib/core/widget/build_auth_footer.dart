import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/auth/presentation/view/register/register.dart';
import 'package:mini_chat/features/auth/presentation/view/sign_in/sign_in.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// Returns a [Row] that displays a message asking the user if they have an
/// account, and provides a link to the other authentication route. If
/// [isRegister] is true, it will display a message asking about having an account
/// and link to the [SignIn] route. Otherwise, it will ask about not having an
/// account and link to the [Register] route. The link text will also be
/// determined by the value of [isRegister].
///
/// The widgets in the returned [Row] are:
///
/// 1. A [Text] displaying the message.
/// 2. A [SizedBox] providing a right margin of 4% of the screen width.
/// 3. An [InkWell] that will navigate to the other authentication route when
///    tapped. The text of the [InkWell] is determined by the value of
///    [isRegister].
///
/// The height of the returned [Row] is determined by the height of its children.
/// ****  8b2737ae-cd0d-4965-9d2c-2dd272f979c8  ******
Row buildAuthFooter({required BuildContext context, bool isRegister = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(isRegister
          ? 'Already have an account?'
          : '''Dont't have an account?'''),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.04,
      ),
      InkWell(
        onTap: () {
          isRegister
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                  (route) => false)
              : Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                );
        },
        child: Text(
          isRegister ? 'Login here' : 'Register here',
          style: const TextStyle(
            color: AppColor.btnColor,
          ),
        ),
      ),
    ],
  );
}
