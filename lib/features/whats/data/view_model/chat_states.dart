abstract class ChatStates {}

class InitialState extends ChatStates {}

class SendMessageSuccessedState extends ChatStates {}

class SendMessageFailedState extends ChatStates {}

class GetMessageSuccessedState extends ChatStates {}

class ScrollSuccessedState extends ChatStates {}

class GetMessageFailedState extends ChatStates {}
