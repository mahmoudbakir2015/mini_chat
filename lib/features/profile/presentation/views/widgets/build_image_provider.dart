import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_styles.dart';

buildImageProvider({bool isGallery = true, void Function()? onTap}) {
  return Card(
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            isGallery ? Icons.photo_library : Icons.camera_alt,
            size: 35,
          ),
          Text(
            isGallery ? 'Gallery' : 'Camera',
            style: AppStyles.textBoldBlack_25,
          ),
        ],
      ),
    ),
  );
}
