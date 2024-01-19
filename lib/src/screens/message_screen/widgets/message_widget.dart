import 'package:flutter/material.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';
import 'package:test_chat/src/common/constants/text_styles.dart';
import 'package:test_chat/src/common/utils/capitalize_letter.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    Key? key,
    required this.message,
    required this.isMine,
    this.hasError = false,
  }) : super(key: key);

  final String message;
  final bool isMine;
  final bool hasError;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
              color: widget.hasError
                  ? Colors.red.withOpacity(.4)
                  : !widget.isMine
                      ? AppColors.grey.withOpacity(.08)
                      : AppColors.greenGradient2,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: widget.isMine
                    ? const Radius.circular(16)
                    : const Radius.circular(4),
                bottomRight: widget.isMine
                    ? const Radius.circular(4)
                    : const Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.capitalize(),
                  style: TextStyles.chatMessage.copyWith(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}', // Замените на реальное время
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
