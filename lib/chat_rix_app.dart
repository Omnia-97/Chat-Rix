import 'package:chat_app/modules/create_account/create_account.dart';
import 'package:flutter/material.dart';

class ChatRix extends StatelessWidget {
  const ChatRix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CreateAccountPage.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        CreateAccountPage.routeName: (context) => const CreateAccountPage(),
      },
    );
  }
}