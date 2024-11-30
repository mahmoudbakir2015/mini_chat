import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/whats/data/model/message_model.dart';
import 'package:mini_chat/features/whats/data/model/user_model.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialState());
  static ChatCubit get(context) => BlocProvider.of(context);
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  TextEditingController messagesController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  String query = '';

  Future<void> sendMessage({required MessageModel messageModel}) async {
    if (messagesController.text.isNotEmpty) {
      // Define references to the chat documents
      final senderChatRef = FirebaseFirestore.instance
          .collection('chats')
          .doc(
            messageModel.senderId,
          )
          .collection('chats')
          .doc(
            messageModel.receiverId,
          );

      final receiverChatRef = FirebaseFirestore.instance
          .collection('chats')
          .doc(messageModel.receiverId)
          .collection('chats')
          .doc(messageModel.senderId);

      // Message data
      final messageData = {
        'text': messageModel.text,
        'image': messageModel.image,
        'timestamp': FieldValue.serverTimestamp(),
        'senderId': messageModel.senderId,
        'receiverId': messageModel.receiverId,
      };

      // Use a batch for atomic writes
      WriteBatch batch = FirebaseFirestore.instance.batch();

      // Add message to sender's subcollection
      batch.set(
        senderChatRef.collection('messages').doc(),
        messageData,
      );

      // Add message to receiver's subcollection
      batch.set(
        receiverChatRef.collection('messages').doc(),
        messageData,
      );

      // Update metadata (e.g., last message, timestamp, unread count)
      batch.set(
        senderChatRef,
        {
          'lastMessage': messageModel.text,
          'lastMessageTime': FieldValue.serverTimestamp(),
          'unreadCount': FieldValue.increment(0), // No unread count for sender
        },
        SetOptions(merge: true),
      );

      batch.set(
        receiverChatRef,
        {
          'lastMessage': messageModel.text,
          'lastMessageTime': FieldValue.serverTimestamp(),
          'unreadCount':
              FieldValue.increment(1), // Increment unread count for receiver
        },
        SetOptions(merge: true),
      );

      // Commit the batch
      await batch.commit();

      // Clear the input field
      messagesController.clear();
    } else {
      emit(SendMessageFailedState()); // Emit a state if the message is empty
    }
  }

  Stream<List<MessageModel>> getMessages(String senderId, String receiverId) {
    // Reference to the messages subcollection for the specific chat
    final messagesRef = FirebaseFirestore.instance
        .collection('chats')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('timestamp', descending: true); // Sort messages by timestamp

    // Return a stream of messages from the Firestore subcollection
    return messagesRef.snapshots().map((snapshot) {
      // Convert the query snapshot into a list of MessageModel objects
      return snapshot.docs.map((doc) {
        return MessageModel.fromFirestore(doc);
      }).toList();
    });
  }

  // Update the user's profile
  Future<void> updateUserProfile(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Update the user's profile
      await firestore.collection('users').doc(userId).update({
        'photo': 'https://example.com/photo.jpg', // Add the user's photo URL
        'status': 'online', // Example: Adding a status field
      });

      log('User profile updated successfully');
    } catch (e) {
      log('Error updating user profile: $e');
    }
  }

//search users
  Stream<List<UserModel>> searchUsers(String query) {
    // Reference to the 'users' collection
    final usersRef = FirebaseFirestore.instance.collection('users');

    return usersRef
        .where('name', isGreaterThanOrEqualTo: query) // Query based on name
        .where('name',
            isLessThan: query +
                'z') // Ensures that the query is lexicographically correct
        .snapshots()
        .map((snapshot) {
      // Map the snapshot to a list of UserModel objects
      return snapshot.docs.map((doc) {
        return UserModel.fromFirestore(doc);
      }).toList();
    });
  }

//create chat
  Future<void> createChat(String userId, String chatId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Create a new chat under the `chats` collection
      await firestore.collection('chats').doc(chatId).set({
        'participants': [userId, 'otherUserId'], // List of participants
        'lastMessage': '',
        'lastMessageTime': Timestamp.now(),
        'unreadCount': 0,
      });

      log('Chat created successfully');
    } catch (e) {
      log('Error creating chat: $e');
    }
  }

  //add message to chat
  Future<void> addMessageToChat(
      String chatId, String senderId, String text) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Add a message to the `messages` subcollection
      await firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'text': text,
        'senderId': senderId,
        'timestamp': Timestamp.now(),
        'isRead': false,
      });

      // Update the parent chat document
      await firestore.collection('chats').doc(chatId).update({
        'lastMessage': text,
        'lastMessageTime': Timestamp.now(),
        'unreadCount': FieldValue.increment(1), // Increment unread count
      });

      log('Message added successfully');
    } catch (e) {
      log('Error adding message: $e');
    }
  }

  // fetch user chats
  Future<void> fetchUserChats(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Fetch chats involving the user
      QuerySnapshot chatsSnapshot = await firestore
          .collection('chats')
          .where('participants', arrayContains: userId)
          .get();

      for (var chat in chatsSnapshot.docs) {
        log(chat.data().toString());
      }
    } catch (e) {
      log('Error fetching chats: $e');
    }
  }

  Future<void> startChat(String senderId, String receiverId) async {
    // Reference to the chat between the sender and receiver
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('chats')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId);

    // Check if the chat exists
    DocumentSnapshot snapshot = await docRef.get();
    if (!snapshot.exists) {
      // Create a new chat document if not exists
      await docRef.set({
        'lastMessage': '',
        'lastMessageTime': Timestamp.now(),
        'unreadCount': 0,
        'messages': [],
      });
    }
  }
}
