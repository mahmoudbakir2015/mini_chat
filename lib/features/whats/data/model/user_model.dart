import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final String photoUrl;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  // Convert Firestore document to UserModel
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      userId: doc.id, // userId is typically the document ID
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      photoUrl: data['photo'] ?? '',
    );
  }
}
