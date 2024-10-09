import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_chat/core/constants/app_icon.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A centered SvgPicture widget that displays the WhatsApp logo.
/// The size of the logo is 20% of the screen's height and width.
/******  faf485b6-34a4-4730-915e-5b2412521282  *******/
Center buildWhatsAppIcon(BuildContext context) {
  return Center(
    child: SvgPicture.asset(
      AppIcon.whatsApp,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.2,
    ),
  );
}
