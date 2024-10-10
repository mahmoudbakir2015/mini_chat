import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_body.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/floating_chat.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// A widget that builds a chat screen.
  ///
  /// This widget is composed of a [Scaffold] widget with a [ChatBody] widget
  /// as its body, and a [FloatingChat] widget as its floating action button.
  ///
  /// When the [FloatingChat] widget is pressed, it calls the [onPressed]
  /// callback function.
  ///
  /// ****  5f7f5b9e-4b9c-4eb1-b3c4-15f3f4a1abf2  ****
  /// ****  c258f311-8d90-43c4-8da3-7d6249fbfac8  ******
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodyChat(),
      floatingActionButton: buildFloatingChat(onPressed: () {}),
    );
  }
}
