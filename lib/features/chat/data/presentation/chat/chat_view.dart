import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:routus_clean/features/chat/data/presentation/chat/widgets/empty_chat_view.dart';
import 'package:routus_clean/components/error_view.dart';
import 'package:routus_clean/features/chat/data/presentation/chat/widgets/other_message_card.dart';
import 'package:routus_clean/features/chat/data/presentation/chat/widgets/sender_message_card.dart';
import 'package:routus_clean/features/chat/data/repository/chat_repository.dart';
import 'package:routus_clean/styles.dart';

import 'chat_cubit.dart';
import 'chat_state.dart';
import 'widgets/message_input_field.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ChatRepository(),
      child: BlocProvider(
        create: (BuildContext context) =>
            ChatCubit(context.read<ChatRepository>()),
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            gradient: Styles.scaffoldGradient,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              forceMaterialTransparency: true,
              title: const Text(
                'Supervisor',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              leading: const BackButton(color: Colors.white),
            ),
            body: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is SendMessageErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                final cubit = BlocProvider.of<ChatCubit>(context);
                if (state is ChatLoadingState) {
                  return LoadingAnimationWidget.hexagonDots(
                    color: Colors.white,
                    size: 36,
                  );
                } else if (state is ChatErrorState) {
                  return ErrorView(
                    message: state.error,
                    onRetry: () => cubit.fetchChat(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: state.allMessages.isEmpty
                              ? const EmptyChatView()
                              : ListView.builder(
                                  reverse: true,
                                  itemCount: state.allMessages.length,
                                  itemBuilder: (context, index) {
                                    final msg = state.allMessages[index];
                                    return msg.senderType!.endsWith('User')
                                        ? SenderMessageCard(
                                            message: msg.content!,
                                            time:
                                                msg.createdAt.formatIsoString(),
                                          )
                                        : OtherMessageCard(
                                            message: msg.content!,
                                            time:
                                                msg.createdAt.formatIsoString(),
                                          );
                                  },
                                ),
                        ),
                        MessageInputField(
                          controller: cubit.inputController,
                          onSend: cubit.sendMessage,
                          sendLoading: state is SendMessageLoadingState,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

extension Iso8601StringFormatting on String? {
  String formatIsoString({String pattern = 'yyyy-MM-dd HH:mm'}) {
    if (this == null) return '';
    try {
      final dateTime = DateTime.parse(this!).toLocal();
      return DateFormat(pattern).format(dateTime);
    } catch (_) {
      return this!;
    }
  }
}
