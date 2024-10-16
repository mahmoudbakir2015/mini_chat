import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

Widget senderMessage() {
  return Container(
    padding: const EdgeInsets.all(8),
    color: Colors.white,
    child: Row(
      children: [
        // Smiley Icon
        IconButton(
          icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
          onPressed: () {},
        ),
        // Text Field
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Message',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        // Attachment Icon
        IconButton(
          icon: const Icon(Icons.attach_file, color: Colors.grey),
          onPressed: () {},
        ),
        // Camera Icon
        IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.grey),
          onPressed: () {},
        ),
        // Microphone Icon
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColor.primaryColor,
          child: IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}
