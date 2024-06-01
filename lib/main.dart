import 'package:chat_app/chat_rix_app.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const ChatRix(),
    ),
  );
}
