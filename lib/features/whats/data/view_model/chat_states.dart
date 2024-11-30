abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSending extends ChatState {}

class ChatSentSuccess extends ChatState {}

class ChatSentFailure extends ChatState {
  final String error;
  ChatSentFailure(this.error);
}
