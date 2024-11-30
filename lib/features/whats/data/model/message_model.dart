import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;
  String? image;
  String? timestamp;
  MessageModel(
      {this.text,
      this.dateTime,
      this.receiverId,
      this.senderId,
      this.timestamp,
      required this.image});

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    text = json['text'];
    image = json['image'];
  }
  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return MessageModel(
      text: data['text'] ?? '',
      image: data['image'] ?? '',
      senderId: data['senderId'] ?? '',
      receiverId: data['receiverId'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['dateTime'] = dateTime;
    data['text'] = text;
    data['image'] = image;
    return data;
  }
}
