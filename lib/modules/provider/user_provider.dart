import 'package:chat_app/database/database_utils.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/contacts/contacts_view.dart';
import 'package:chat_app/modules/home/home_view.dart';
import 'package:chat_app/modules/settings/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;
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
    const ContactsView(),
    const SettingsView(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

}
