import 'package:flutter/material.dart';
import 'package:test_chat/src/common/local/message_screen_args.dart';
import 'package:test_chat/src/common/router/routing_constant.dart';
import 'package:test_chat/src/screens/chat_screen/chat_screen.dart';
import 'package:test_chat/src/screens/message_screen/messages_screen.dart';

class MetaRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutingConstant.chat:
        return MaterialPageRoute(
          builder: (context) {
            return const ChatScreen();
          },
        );

      case RoutingConstant.chatMessage:
        MessageScreenArgs args = routeSettings.arguments as MessageScreenArgs;
        return MaterialPageRoute(
          builder: (context) {
            return MessageScreen(
              iamge: args.iamge,
              name: args.name,
              iamgeText: args.iamgeText,
              status: args.status,
            );
          },
        );
    }
    return null;
  }
}
