import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/features/whats/presentation/views/whats_view.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function to build a button for logging in or signing up.
/// The button is `double.infinity` in width and the height is 6.6% of the screen height.
/// If [isRegister] is true, the text of the button is 'Sign Up', otherwise it is 'Log In'.
/// The button is colored with [AppColor.btnColor].
/// The style of the button is [AppStyles.textBoldBlack_25] with a font size of 20.
/// ****  43f01cd1-bf35-4631-95b3-9fd3778dda43  ******
SizedBox buildAuthButton(
    {required BuildContext context,
    bool isRegister = false,
    required void Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.066,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        isRegister ? 'Sign Up' : 'Log In',
        style: AppStyles.textBoldBlack_25.copyWith(
          fontSize: 20,
        ),
      ),
    ),
  );
}
