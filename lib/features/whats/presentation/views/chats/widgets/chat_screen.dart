import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String receiverId;
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({super.key, required this.receiverId, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with $name')),
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: Column(
          children: [
            // عرض الرسائل
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .where('senderId', whereIn: [
                      FirebaseAuth.instance.currentUser?.uid,
                      receiverId
                    ])
                    .where('receiverId', whereIn: [
                      FirebaseAuth.instance.currentUser?.uid,
                      receiverId
                    ])
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No messages found.'));
                  }

                  var messages = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var data = messages[index];
                      bool isMe = data['senderId'] ==
                          FirebaseAuth.instance.currentUser?.uid;

                      return ListTile(
                        title: Text(data['text']),
                        subtitle: Text(isMe ? 'You' : 'Friend'),
                        trailing: isMe ? Icon(Icons.check) : null,
                      );
                    },
                  );
                },
              ),
            ),
            // حقل النص وزر الإرسال
            BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSentSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Message Sent!')),
                  );
                } else if (state is ChatSentFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Failed to send message: ${state.error}')),
                  );
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration:
                              InputDecoration(labelText: 'Enter message...'),
                        ),
                      ),
                      IconButton(
                        icon: state is ChatSending
                            ? CircularProgressIndicator()
                            : Icon(Icons.send),
                        onPressed: () {
                          if (_messageController.text.isNotEmpty) {
                            // إرسال الرسالة
                            BlocProvider.of<ChatCubit>(context).sendMessage(
                                _messageController.text, receiverId);
                            _messageController.clear();
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
