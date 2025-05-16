import 'package:routus_clean/features/chat/data/models/chat_message.dart';

abstract class ChatState {
  final List<ChatMessage> allMessages;

  ChatState({this.allMessages = const []});
}

class ChatInitState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatErrorState extends ChatState {
  final String error;

  ChatErrorState(this.error);
}

class ChatSuccessState extends ChatState {
  ChatSuccessState({required super.allMessages});
}

class SendMessageLoadingState extends ChatState {
  SendMessageLoadingState({required super.allMessages});
}

class SendMessageSuccessState extends ChatState {
  SendMessageSuccessState({required super.allMessages});
}

class SendMessageErrorState extends ChatState {
  final String error;

  SendMessageErrorState({required super.allMessages, required this.error});
}
