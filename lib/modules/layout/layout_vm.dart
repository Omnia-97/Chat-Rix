import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/layout/layout_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LayoutViewModel extends BaseViewModel<LayoutNavigator> {
  void signOut() async {
    await FirebaseAuth.instance.signOut();
    navigator!.goToLogin();
    navigator!.showSuccessMassage('Successfully logged out');
  }
}
