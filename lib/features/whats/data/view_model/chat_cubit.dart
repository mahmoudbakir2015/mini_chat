import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_states.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

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
