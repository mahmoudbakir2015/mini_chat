import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mini_chat/features/chat/data/model/message_model.dart';
import 'package:mini_chat/features/chat/data/view_model/chat_states.dart';

class ChatCubit extends Cubit<ChateStates> {
  ChatCubit() : super(InitialState());
  static ChatCubit get(context) => BlocProvider.of(context);
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  TextEditingController messagesController = TextEditingController();

  Future<void> sendMessage({required MessageModel messageModel}) async {
    if (messagesController.text.isNotEmpty) {
      DocumentReference docRef = chats
          .doc(messageModel.senderId)
          .collection('chats')
          .doc(messageModel.receiverId);
      await FirebaseFirestore.instance.runTransaction(
        (transaction) async {
          DocumentSnapshot snapshot = await transaction.get(docRef);
          if (!snapshot.exists) {
            transaction.set(docRef, {
              'messages': [
                {
                  'text': messageModel.text,
                  'image': messageModel.image,
                  'date': DateFormat.jm().format(DateTime.now()).toString(),
                  'senderId': messageModel.senderId,
                  'recieverId': messageModel.receiverId,
                }
              ]
            });
          } else {
            List<dynamic> messages = snapshot['messages'] ?? [];
            messages.add(
              {
                'text': messageModel.text,
                'image': messageModel.image,
                'date': DateFormat.jm().format(DateTime.now()).toString(),
                'senderId': messageModel.senderId,
                'recieverId': messageModel.receiverId,
              },
            );
            transaction.update(docRef, {'messages': messages});
          }
        },
      ).then((onValue) async {
        DocumentReference docRef = chats
            .doc(messageModel.receiverId)
            .collection('chats')
            .doc(messageModel.senderId);
        await FirebaseFirestore.instance.runTransaction(
          (transaction) async {
            DocumentSnapshot snapshot = await transaction.get(docRef);
            if (!snapshot.exists) {
              transaction.set(docRef, {
                'messages': [
                  {
                    'text': messageModel.text,
                    'image': messageModel.image,
                    'date': DateFormat.jm().format(DateTime.now()).toString(),
                    'senderId': messageModel.senderId,
                    'recieverId': messageModel.receiverId,
                  }
                ]
              });
            } else {
              List<dynamic> messages = snapshot['messages'] ?? [];
              messages.add(
                {
                  'text': messageModel.text,
                  'image': messageModel.image,
                  'date': DateFormat.jm().format(DateTime.now()).toString(),
                  'senderId': messageModel.senderId,
                  'recieverId': messageModel.receiverId,
                },
              );
              transaction.update(docRef, {'messages': messages});
            }
          },
        );
      }).then((onValue) {
        emit(SendMessageFailedState());
      });
      messagesController.clear();
    }
  }
}
