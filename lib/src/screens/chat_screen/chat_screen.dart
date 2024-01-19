import 'package:flutter/material.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';
import 'package:test_chat/src/common/constants/text_styles.dart';
import 'package:test_chat/src/common/widgets/test_text_field.dart';
import 'package:test_chat/src/screens/chat_screen/widgets/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

List<Map> listChat = [
  {
    'image':
        'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
    'imageText': 'BB',
    'name': 'Виктор Власов',
    'incoming': true,
    'lastMessage': 'Уже сделал?',
    'date': 'Вчера',
  },
  {
    'image':
        'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
    'imageText': 'CA',
    'name': 'Саша Алексеев',
    'incoming': false,
    'lastMessage': 'Я готов',
    'date': '2 минуты назад',
  },
  {
    'image': null,
    'imageText': 'ПЖ',
    'name': 'Пётр Жаринов',
    'incoming': true,
    'lastMessage': 'Я вышел',
    'date': '09:23',
  },
  {
    'image': null,
    'imageText': 'АЖ',
    'name': 'Алина Жукова',
    'incoming': false,
    'lastMessage': 'Hello',
    'date': '12.01.22',
  },
];

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                'Чаты',
                style: TextStyles.heading,
              ),
              const SizedBox(
                height: 6,
              ),
              const TestTextField(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkGrey,
                ),
                placeholder: 'Поиск',
              ),
              const SizedBox(
                height: 24,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    onPressed: () {},
                    name: listChat[index]['name'],
                    lastMessage: listChat[index]['lastMessage'],
                    incomingMessage: listChat[index]['incoming'],
                    date: listChat[index]['date'],
                    iamge: listChat[index]['image'],
                    iamgeText: listChat[index]['imageText'],
                  );
                },
                itemCount: listChat.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
