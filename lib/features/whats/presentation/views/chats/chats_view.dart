import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_body.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/floating_chat.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodyChat(),
      floatingActionButton: buildFloatingChat(onPressed: () {}),
    );
  }
}
