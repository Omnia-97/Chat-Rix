import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';

abstract class CreateAccountNavigator extends BaseNavigator {
 void goToHome(UserModel userModel);
}