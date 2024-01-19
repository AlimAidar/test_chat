import 'package:flutter/material.dart';
import 'package:test_chat/src/common/router/routing_constant.dart';
import 'package:test_chat/src/screens/chat_screen/chat_screen.dart';
import 'package:test_chat/src/screens/chat_screen/messages_screen.dart';

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
        return MaterialPageRoute(
          builder: (context) {
            return MessageScreen();
          },
        );
    }
    return null;
  }
}
