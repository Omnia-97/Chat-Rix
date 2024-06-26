import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/home/home_view.dart';
import 'package:chat_app/modules/settings/settings_view.dart';
import 'package:chat_app/shared/database/database_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;
  String? _imagePath;

  String? get imagePath => _imagePath;

  setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }
  UserProvider() {
    initializeUser();
  }
  Future<void> initUser() async {
    if (firebaseUser != null) {
      userModel = await DataBaseUtils.readUserFromFireStore(firebaseUser!.uid);
    }
    notifyListeners();
  }

  Future<void> initializeUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await initUser();
    }
  }

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeView(),
    const SettingsView(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
