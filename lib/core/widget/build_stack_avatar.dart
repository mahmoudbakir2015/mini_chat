import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

Stack buildStackAvatar({required String image, bool isProfile = true}) {
  return Stack(
    children: [
      CircleAvatar(
        radius: !isProfile ? 30 : 60,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
      !isProfile
          ? Positioned(
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
            )
          : Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.edit, size: 20, color: Colors.white),
              ),
            ),
    ],
  );
}
