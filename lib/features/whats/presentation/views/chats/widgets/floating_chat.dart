import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

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
