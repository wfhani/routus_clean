import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routus_clean/styles.dart';

class MessageInputField extends StatefulWidget {
  const MessageInputField(
      {super.key,
      required this.controller,
      required this.onSend,
      required this.sendLoading});

  final TextEditingController controller;
  final VoidCallback onSend;
  final bool sendLoading;

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  late final TextEditingController _controller;
  bool _showEmojiPicker = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  void _onEmojiSelected(Emoji emoji) {
    _controller.text += emoji.emoji;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
  }

  void _toggleEmojiPicker() {
    if (_showEmojiPicker) {
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      _focusNode.unfocus();
    }
    setState(() => _showEmojiPicker = !_showEmojiPicker);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 7,
              child: Focus(
                onFocusChange: (value) {
                  setState(() => _showEmojiPicker = false);
                },
                child: TextFormField(
                  onTapOutside: (event) {
                    _focusNode.unfocus();
                    setState(() => _showEmojiPicker = false);
                  },
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Type your message',
                    hintStyle:
                        const TextStyle(color: Styles.lightGrey, fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Styles.lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/smile.svg',
                        height: 24,
                      ),
                      onPressed: _toggleEmojiPicker,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: widget.sendLoading
                  ? const SpinKitThreeBounce(color: Colors.white, size: 14)
                  : InkWell(
                      onTap: widget.onSend,
                      child: SvgPicture.asset('assets/icons/send.svg'),
                    ),
            ),
          ],
        ),
        if (_showEmojiPicker)
          SizedBox(
            height: 250,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) => _onEmojiSelected(emoji),
            ),
          ),
      ],
    );
  }
}
