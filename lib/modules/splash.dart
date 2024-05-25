import 'package:chat_app/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PagesRouteName.signUp);
    });
    return Image.asset(
      AppImages.splash,
      fit: BoxFit.cover,
      width: mediaQuery.width,
      height: mediaQuery.height,
    );
  }
}
