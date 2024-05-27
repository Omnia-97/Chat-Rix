import 'package:chat_app/database/database_utils.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/sign_in/sign_in_navigator.dart';
import 'package:chat_app/shared/data/errors/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInViewModel extends BaseViewModel<SignInNavigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signIn({required String email, required String password}) async {
    try {
      navigator!.showLoading();
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        final userId = credential.user!.uid;
        final userData = await DataBaseUtils.readUserFromFireStore(userId);

        if (userData != null) {
          UserModel userModel = UserModel(
            id: userData.id,
            email: userData.email,
            userName: userData.userName,
          );
          navigator!.hideLoading();
          navigator!.goToHome(userModel);
          return;
        } else {
          navigator!.showErrorMassage('User not found in the database');
        }
      } else {
        navigator!.showErrorMassage('Failed to authenticate user');
      }
    } on FirebaseAuthException catch (e) {
      navigator!.hideLoading();
      navigator!.showErrorMassage('Wrong password or email');
    } catch (e) {
      navigator!.hideLoading();
      navigator!.showErrorMassage(FirebaseErrors.somethingWentWrong);
    }
  }
}
