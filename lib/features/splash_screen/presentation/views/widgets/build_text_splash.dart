import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function to build a text column for the splash screen.
/// The text is 'Whats Up' and 'The best chat app for this century'.
/// The text is centered horizontally and vertically in the parent widget.
/// The text is styled with [AppStyles.textBoldBlack_25] and the color of the second text is [AppColor.primaryColor].
/// The height of the [SizedBox] between the two texts is 10% of the screen height.
///
/******  0997b24c-64fe-43e0-a42e-df646cb33673  *******/
buildTextSplash(BuildContext context) {
  return Column(
    children: [
      const Text(
        'Whats Up',
        style: AppStyles.textBoldBlack_25,
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      Text(
        'The best chat app for this century',
        style: AppStyles.textBoldBlack_25.copyWith(
          color: AppColor.primaryColor,
          fontSize: 18,
        ),
      ),
    ],
  );
}
