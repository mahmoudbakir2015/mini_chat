import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/whats/data/model/message_model.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';

class ChatScreen extends StatelessWidget {
  final String senderId;
  final String receiverId;

  ChatScreen({super.key, required this.senderId, required this.receiverId});

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChatCubit chatCubit = ChatCubit();
    return BlocBuilder<ChatCubit, ChatStates>(
      bloc: chatCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chat with $receiverId'),
          ),
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder<List<MessageModel>>(
                  stream: chatCubit.getMessages(senderId, receiverId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No messages yet.'));
                    }

                    final messages = snapshot.data!;

                    return ListView.builder(
                      reverse: true, // To show the latest message at the bottom
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];

                        return ListTile(
                          title: Text(message.text.toString()),
                          subtitle: Text('Sent by: ${message.senderId}'),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(hintText: 'Type a message'),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        final message = MessageModel(
                          text: _messageController.text,
                          image: '', // You can add image functionality
                          senderId: senderId,
                          receiverId: receiverId,
                          timestamp: Timestamp.now().toString(),
                        );
                        chatCubit.sendMessage(
                            messageModel:
                                message); // Call your sendMessage function here
                        _messageController.clear();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
