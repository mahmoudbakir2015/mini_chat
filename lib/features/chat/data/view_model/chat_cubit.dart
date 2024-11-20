import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:z/controller/cubit/chat/chat_states.dart';
import '../../../data/model/message_model.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialChatState());
  static ChatCubit get(context) => BlocProvider.of(context);
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  TextEditingController messagesController = TextEditingController();

  Future<void> sendMessage({required MessageModel messageModel}) async {
    if (messagesController.text.isNotEmpty) {
      DocumentReference docRef = chats
          .doc(messageModel.senderId)
          .collection('chats')
          .doc(messageModel.reciverId);
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
                  'recieverId': messageModel.reciverId,
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
                'recieverId': messageModel.reciverId,
              },
            );
            transaction.update(docRef, {'messages': messages});
          }
        },
      ).then((onValue) async {
        DocumentReference docRef = chats
            .doc(messageModel.reciverId)
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
                    'recieverId': messageModel.reciverId,
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
                  'recieverId': messageModel.reciverId,
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
