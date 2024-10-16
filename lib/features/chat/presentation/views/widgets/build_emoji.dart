import 'package:emoji_picker_flutter/emoji_picker_flutter.dart' as emoji_picker;
import 'package:flutter/material.dart';

class BuildEmoji extends StatefulWidget {
  const BuildEmoji({super.key});

  @override
  State<BuildEmoji> createState() => _BuildEmojiState();
}

class _BuildEmojiState extends State<BuildEmoji> {
  final TextEditingController _controller =
      TextEditingController(); // Added controller

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 250, // Height of the emoji picker card
        child: emoji_picker.EmojiPicker(
          onEmojiSelected: (category, emoji) {
            // Corrected signature
            setState(() {
              _controller.text +=
                  emoji.emoji; // Add selected emoji to text field
            });
          },
          config: const emoji_picker.Config(
            columns: 7,
            emojiSizeMax: 32.0,
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            initCategory: emoji_picker.Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
            indicatorColor: Colors.green,
            iconColor: Colors.grey,
            iconColorSelected: Colors.green,
            // progressIndicatorColor: Colors.green,
            backspaceColor: Colors.red,
            skinToneDialogBgColor: Colors.white,
            enableSkinTones: true,
            // showRecentsTab: true,
          ),
        ),
      ),
    );
  }
}
