import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

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
