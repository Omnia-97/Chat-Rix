import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/settings/setting_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingViewModel extends BaseViewModel<SettingNavigator> {
  void signOut() async {
    await FirebaseAuth.instance.signOut();
    navigator!.goToLogin();
    navigator!.showSuccessMassage('Successfully logged out');
  }
}
