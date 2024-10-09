import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_chat/core/constants/app_icon.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// Returns a [SvgPicture] widget of the WhatsApp logo.
///
/// The logo size is set to 18% of the screen height and width.
///
/// The widget is centered horizontally using a [Center] widget.
/// ****  126bf4d7-604f-4782-8726-f2fd801eb2f7  ******
buildLogo(BuildContext context) {
  return Center(
    child: SvgPicture.asset(
      AppIcon.whatsApp,
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.18,
    ),
  );
}
