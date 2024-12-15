import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_list_body.dart';

Widget buildEmojiPicker() {
  return SizedBox(
    height: 250,
    child: EmojiPicker(
      onEmojiSelected: (category, emoji) {
        chatCubit.messageController.text += emoji.emoji;
      },
    ),
  );
}
