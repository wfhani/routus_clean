import 'chat_message.dart';

class SentMessageResponse {
  String? message;
  ChatMessage? chatMessage;

  SentMessageResponse({this.message, this.chatMessage});

  SentMessageResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    chatMessage =
        json['data'] != null ? ChatMessage.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.chatMessage != null) {
      data['data'] = this.chatMessage!.toJson();
    }
    return data;
  }
}
