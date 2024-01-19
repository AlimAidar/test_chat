import 'package:flutter/material.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';
import 'package:test_chat/src/common/constants/text_styles.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.incomingMessage,
    required this.date,
    required this.iamge,
    required this.iamgeText,
    required this.onPressed,
  }) : super(key: key);
  final String? iamge;
  final String iamgeText;
  final String name;
  final String lastMessage;
  final bool incomingMessage;
  final String date;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            iamge != null
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(iamge!), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(360),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.greenGradient1,
                          AppColors.greenGradient2
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.greenGradient1,
                          AppColors.greenGradient2
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        iamgeText,
                        style: TextStyles.chatImageText,
                      ),
                    ),
                  ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.chatName,
                ),
                Row(
                  children: [
                    incomingMessage
                        ? const Text(
                            'Вы: ',
                            style: TextStyles.chatName,
                          )
                        : const Offstage(),
                    Text(
                      lastMessage,
                      style: TextStyles.chatMessage,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyles.chatMessage,
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }
}
