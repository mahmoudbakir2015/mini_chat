import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

ListTile buildMyStatus({required String image, void Function()? onTap}) {
  return ListTile(
    leading: Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.add, size: 20, color: Colors.white),
          ),
        ),
      ],
    ),
    title:
        const Text('My Status', style: TextStyle(fontWeight: FontWeight.bold)),
    subtitle: const Text('Tap to add status update'),
    onTap: onTap,
  );
}
