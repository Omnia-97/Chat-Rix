import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      var provider = Provider.of<UserProvider>(context, listen: false);
      provider.firebaseUser != null
          ? Navigator.pushReplacementNamed(context, PagesRouteName.home)
          : Navigator.pushReplacementNamed(context, PagesRouteName.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Image.asset(
      AppImages.splash,
      fit: BoxFit.fill,
      width: mediaQuery.width,
      height: mediaQuery.height,
    );
  }
}
