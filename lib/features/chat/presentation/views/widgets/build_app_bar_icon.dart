import 'package:flutter/material.dart';

buildAppBarIcon({required IconData? icon, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Icon(
        icon,
      ),
    ),
  );
}
