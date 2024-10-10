import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function to build an avatar which is a small rounded rectangle with a
/// certain [icon] in the center.
///
/// The avatar is a [InkWell] widget, so it can be tapped. The [onTap] parameter
/// is a function that will be called when the avatar is tapped.
///
/// The avatar is a [Container] widget with a certain height and width. The
/// height is 5% of the screen height and the width is 10% of the screen width.
/// The avatar is colored with [AppColor.lightColor] and has a
/// [BorderRadius.circular] of 8.
///
/// The [icon] is an [IconData] which is used to create an [Icon] widget. The
/// size of the icon is 30 and the color is [AppColor.secondaryColor].
///
/// The [context] is a [BuildContext] which is used to get the size of the
/// screen.
/// ****  b9416a6a-7f33-4c7a-b946-063090bc461b  ******
buildAvatar(
    {required BuildContext context,
    required IconData? icon,
    void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          color: AppColor.lightColor,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Icon(
          icon,
          size: 30,
          color: AppColor.secondaryColor,
        ),
      ),
    ),
  );
}
