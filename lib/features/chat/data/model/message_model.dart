class MessageModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;
  String? image;
  MessageModel(
      {this.text,
      this.dateTime,
      this.receiverId,
      this.senderId,
      required this.image});

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    text = json['text'];
    image = json['image'];
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
