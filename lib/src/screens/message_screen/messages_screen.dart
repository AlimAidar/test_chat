import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';
import 'package:test_chat/src/common/widgets/test_divider.dart';
import 'package:test_chat/src/common/widgets/test_text_field.dart';
import 'package:test_chat/src/screens/message_screen/widgets/message_appbar_widget.dart';
import 'package:test_chat/src/screens/message_screen/widgets/message_widget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    Key? key,
    required this.name,
    required this.status,
    required this.iamge,
    required this.iamgeText,
  }) : super(key: key);

  final String name;
  final String status;
  final String iamge;
  final String iamgeText;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late ImagePicker _picker;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  List<Map> messages = [
    {
      'message': 'Привет',
      'is_mine': false,
    },
    {
      'message': 'Как дела?',
      'is_mine': false,
    }
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MessageAppBarWidget(
              name: widget.name,
              status: widget.status,
              iamge: widget.iamge,
              iamgeText: widget.iamgeText,
            ),
            const TestDivider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true, // Установите параметр reverse в true
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  int reversedIndex =
                      messages.length - 1 - index; // Инвертируйте индексы
                  return MessageWidget(
                    key: ValueKey(reversedIndex),
                    message: messages[reversedIndex]['message'],
                    isMine: messages[reversedIndex]['is_mine'],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            const TestDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.lightGrey,
                      ),
                      child: const Icon(Icons.attach_file_rounded),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TestTextField(
                      onEditingComplete: () {
                        String newMessage = _messageController.text.trim();
                        if (newMessage.isNotEmpty) {
                          setState(() {
                            messages.add({
                              'message': newMessage,
                              'is_mine': true,
                            });
                            _messageController.clear();
                          });
                        }
                      },
                      controller: _messageController,
                      lableText: 'Сообщение',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      String newMessage = _messageController.text.trim();
                      if (newMessage.isNotEmpty) {
                        setState(() {
                          messages.add({
                            'message': newMessage,
                            'is_mine': true,
                          });
                          _messageController.clear();
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.lightGrey,
                      ),
                      child: const Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
