import 'package:chat_app/modules/create_account/create_account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRix extends StatelessWidget {
  const ChatRix({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            initialRoute: CreateAccountView.routeName,
            debugShowCheckedModeBanner: false,
            routes: {
              CreateAccountView.routeName: (context) =>
                   CreateAccountView(),
            },
          );
        });
  }
}
