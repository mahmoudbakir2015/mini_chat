import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Function to get chats for the current user
  Stream<List<Map<String, dynamic>>> getChats() {
    final currentUser = _auth.currentUser;
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
  Future<void> sendMessage(String message, String receiverId) async {
    try {
      emit(ChatSending()); // تغيير الحالة إلى "جاري الإرسال"
      String senderId =
          FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';
      CollectionReference messages =
          FirebaseFirestore.instance.collection('messages');

      // إضافة الرسالة إلى Firestore
      await messages.add({
        'text': message,
        'senderId': senderId,
        'receiverId': receiverId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      emit(ChatSentSuccess()); // إرسال الرسالة بنجاح
    } catch (e) {
      emit(ChatSentFailure(e.toString())); // في حالة وجود خطأ
    }
  }
}
