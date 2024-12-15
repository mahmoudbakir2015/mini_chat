import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isEmojiVisible = false;

// Function to get chats for the current user
  Stream<List<Map<String, dynamic>>> getChats() {
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      return Stream.value([]);
    }

    return FirebaseFirestore.instance
        .collection('messages')
        .where('participants',
            arrayContains:
                currentUser.uid) // Query chats involving the current user
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((chatDoc) {
        final chatData = chatDoc.data();
        final lastMessage = chatData['lastMessage'] ?? 'No messages yet';
        final participants = List<String>.from(chatData['participants'] ?? []);

        final otherUserId = participants
            .firstWhere((id) => id != currentUser.uid, orElse: () => '');

        return {
          'chatId': chatDoc.id,
          'lastMessage': lastMessage,
          'participants': participants,
          'receiverId': otherUserId,
        };
      }).toList();
    });
  }

// Function to get the name of the user
  Future<Map<String, dynamic>?> getUserdata(String userId) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        return userDoc.data(); // Return user data if document exists
      } else {
        return null; // Return null if the document doesn't exist
      }
    } catch (e) {
      log("Error fetching user data: $e");
      return null; // Return null in case of an error
    }
  }

  // إرسال الرسالة
  // Future<void> sendMessage(String message, String receiverId) async {
  //   try {
  //     emit(ChatSending()); // تغيير الحالة إلى "جاري الإرسال"
  //     String senderId =
  //         FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';
  //     CollectionReference messages =
  //         FirebaseFirestore.instance.collection('messages');

  //     // إضافة الرسالة إلى Firestore
  //     await messages.add({
  //       'text': message,
  //       'senderId': senderId,
  //       'receiverId': receiverId,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });

  //     emit(ChatSentSuccess()); // إرسال الرسالة بنجاح
  //   } catch (e) {
  //     emit(ChatSentFailure(e.toString())); // في حالة وجود خطأ
  //   }
  // }

  Future<void> sendMessage({
    required String text,
    required String receiverId,
  }) async {
    if (text.trim().isEmpty) return;

    final currentUser = auth.currentUser;
    if (currentUser == null) return;

    String senderId = currentUser.uid;

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatId = ids.join('_');

    final messageData = {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection('chats')
        .add(messageData);

    final chatSummaryData = {
      'lastMessage': text,
      'lastMessageTime': FieldValue.serverTimestamp(),
      'participants': [senderId, receiverId],
    };

    await FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .set(chatSummaryData, SetOptions(merge: true))
        .then((onValue) {
      emit(MessageSentSuccessed());
    }).catchError((onError) {
      log('send message error => ${onError.toString()}');
      emit(MessageSentFailed(onError.toString()));
    });

    messageController.clear();

    // Scroll to the bottom after sending a message
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToBottom();
    });
  }

  Stream<QuerySnapshot> getMessages({required String receiverId}) {
    final currentUser = auth.currentUser;
    if (currentUser == null) return const Stream.empty();

    String senderId = currentUser.uid;

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatId = ids.join('_');

    return FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection('chats')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  void toggleEmojiPicker() {
    emit(ChangeStateEmojiVisible());
    isEmojiVisible = !isEmojiVisible;
  }

  // Function to scroll to the last message
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return '';
    DateTime date = timestamp.toDate();
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }
}
