import 'dart:developer';
import 'package:routus_clean/core/api_service.dart';
import 'package:routus_clean/features/chat/data/models/chat_message.dart';
import 'package:routus_clean/features/chat/data/models/sent_message_response.dart';

class ChatRepository {
  int receiverId = 10;
  String receiverType = 'Supervisor';

  Future<List<ChatMessage>> fetchChat() async {
    // final token = await PreferencesHelper().getToken();
    const token = '17|F6DqzgMLXPA1wpp30ZrJaPOINppixgLyX0iMUV3cabf7ea7c';

    try {
      log('Bearer $token');
      final jsonData = await ApiService().get(
        'chat/10',
        headers: {'Authorization': 'Bearer $token'},
      );
      List<ChatMessage> messages = [];
      jsonData.forEach((item) {
        messages.add(ChatMessage.fromJson(item));
      });
      return messages;
    } catch (e) {
      throw Exception('Request Error');
    }
  }

  Future<SentMessageResponse> sendMessage({required String message}) async {
    // final token = await PreferencesHelper().getToken();
    const token = '17|F6DqzgMLXPA1wpp30ZrJaPOINppixgLyX0iMUV3cabf7ea7c';
    try {
      final jsonData = await ApiService().post('chat', headers: {
        'Authorization': 'Bearer $token'
      }, body: {
        "receiver_id": 10,
        "receiver_type": "Supervisor",
        "message": message,
      });
      return SentMessageResponse.fromJson(jsonData);
    } catch (e) {
      throw Exception('Request Error');
    }
  }
}
