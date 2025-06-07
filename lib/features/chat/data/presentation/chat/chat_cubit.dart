import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:routus_clean/features/chat/data/models/chat_message.dart';
import 'package:routus_clean/features/chat/data/repository/chat_repository.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepository) : super(ChatInitState()) {
    fetchChat();
  }

  final ChatRepository _chatRepository;
  final TextEditingController inputController = TextEditingController();

  fetchChat() async {
    emit(ChatLoadingState());
    try {
      final messages = await _chatRepository.fetchChat();
      emit(ChatSuccessState(allMessages: messages.reversed.toList()));
    } catch (e) {
      emit(ChatErrorState('$e'));
    }
  }

  sendMessage() async {
    if (inputController.text.trim().isEmpty) return;
    emit(
      SendMessageLoadingState(allMessages: state.allMessages),
    );
    try {
      final response = await _chatRepository.sendMessage(
        message: inputController.text,
      );
      final message = response.chatMessage!;
      emit(SendMessageSuccessState(
          allMessages: [message, ...state.allMessages]));
      inputController.clear();
    } catch (e) {
      emit(
        SendMessageErrorState(
          allMessages: state.allMessages,
          error: 'Message not sent try again',
        ),
      );
    }
  }
}
