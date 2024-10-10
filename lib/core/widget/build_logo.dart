import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_chat/core/constants/app_icon.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function to build a logo for the splash screen.
/// The logo is a SvgPicture widget with the size of 18% of the screen height and width.
/// The logo is centered horizontally and vertically in the parent widget.
/// ****  fcf8ecb5-d28f-46cc-a9b2-c926874738f4  ******
buildLogo(BuildContext context) {
  return Center(
    child: SvgPicture.asset(
      AppIcon.whatsApp,
      placeholderBuilder: (context) => const CircularProgressIndicator(),
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.18,
    ),
  );
}
