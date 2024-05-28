import 'package:chat_app/modules/chat/chat_view.dart';
import 'package:chat_app/modules/create_account/create_account_view.dart';
import 'package:chat_app/modules/create_new_room/create_new_room_view.dart';
import 'package:chat_app/modules/home/home_view.dart';
import 'package:chat_app/modules/layout/layout_view.dart';
import 'package:chat_app/modules/sign_in/sign_in_view.dart';
import 'package:chat_app/modules/splash.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
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
      case PagesRouteName.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
      case PagesRouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
      case PagesRouteName.createRoom:
        return MaterialPageRoute(
          builder: (context) => const CreateNewRoomView(),
          settings: settings,
        );
      case PagesRouteName.chat:
        return MaterialPageRoute(
          builder: (context) => const ChatView(),
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
