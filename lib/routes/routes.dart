import 'package:chat_app/modules/create_account/create_account_view.dart';
import 'package:chat_app/modules/sign_in/sign_in_view.dart';
import 'package:chat_app/modules/splash.dart';
import 'package:chat_app/routes/pages_route_name.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case PagesRouteName.signUp:
        return MaterialPageRoute(
          builder: (context) => const CreateAccountView(),
          settings: settings,
        );
      case PagesRouteName.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
