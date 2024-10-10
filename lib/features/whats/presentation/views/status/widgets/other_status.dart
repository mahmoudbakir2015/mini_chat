import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

ListTile buildOtherStatus({
  required String image,
  required bool isViewed,
  required String name,
  required String time,
  void Function()? onTap,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      backgroundColor: isViewed
          ? Colors.transparent
          : AppColor.secondaryColor, // Green border
      child: CircleAvatar(
        radius: 26,
        backgroundImage: NetworkImage(
          image, // Replace with actual profile image
        ),
      ),
    ),
    title: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    subtitle: Text(
      time,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
    onTap: onTap,
  );
}
