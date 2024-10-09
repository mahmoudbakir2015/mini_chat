import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_chat/core/constants/app_icon.dart';

Center buildWhatsAppIcon(BuildContext context) {
  return Center(
    child: SvgPicture.asset(
      AppIcon.whatsApp,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.2,
    ),
  );
}
