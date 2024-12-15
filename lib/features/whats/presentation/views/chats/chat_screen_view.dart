import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_screen_body.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String name;

  const ChatScreen({required this.receiverId, required this.name, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatCubit chatCubit = ChatCubit();

  @override
  void dispose() {
    chatCubit.messageController.dispose();
    chatCubit.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.teal[800],
      ),
      body: buildChatScreenBody(
        receiverId: widget.receiverId,
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
