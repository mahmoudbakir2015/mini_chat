import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// Returns a [FloatingActionButton] which is used to navigate to the chat screen.
///
/// The button is colored with [AppColor.secondaryColor] and has a white [Icon]
/// with the chat icon.
///
/// The [onPressed] callback is called when the button is pressed.
///
/// ****  e8f1f24b-7c4f-4a8d-8a4c-5e5c21f2c9c8  ******
/// ****  278a3d85-b72e-448e-a54e-1f35383d5595  ******
FloatingActionButton buildFloatingChat({required void Function()? onPressed}) {
  return FloatingActionButton(
    backgroundColor: AppColor.secondaryColor,
    onPressed: onPressed,
    child: const Icon(
      Icons.chat,
      color: Colors.white,
    ),
  );
}
