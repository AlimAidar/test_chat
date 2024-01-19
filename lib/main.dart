import 'package:flutter/material.dart';
import 'package:test_chat/src/common/router/routing_constant.dart';

import 'src/common/router/router.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: RoutingConstant.chat,
      onGenerateRoute: MetaRouter.onGenerateRoute,
    );
  }
}
