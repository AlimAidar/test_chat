import 'package:flutter/material.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';
import 'package:test_chat/src/common/constants/text_styles.dart';
import 'package:test_chat/src/common/widgets/test_button.dart';

class MessageAppBarWidget extends StatelessWidget {
  const MessageAppBarWidget({
    Key? key,
    required this.name,
    required this.status,
    required this.iamge,
    required this.iamgeText,
  }) : super(key: key);
  final String? iamge;
  final String iamgeText;
  final String name;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          TestButton(
            onPressed: () {},
            labelWidget: const Icon(Icons.arrow_back_ios_new),
          ),
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
              Text(
                status,
                style: TextStyles.chatMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
