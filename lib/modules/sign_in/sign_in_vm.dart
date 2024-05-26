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
      UserModel? userModel =
          await DataBaseUtils.readUserFromFireStore(credential.user?.uid ?? "");
      if (userModel != null) {
        navigator!.goToHome(userModel);
      } else {
        navigator!.showErrorMassage('User not found');
      }
    /*  navigator!.hideLoading();
      navigator!.showSuccessMassage('Successfully logged in');
      navigator!.hideLoading();*/
      //onSuccess();
    } on FirebaseAuthException catch (e) {
      navigator!.hideLoading();
      navigator!.showErrorMassage('Wrong password or email');
    } catch (e) {
      navigator!.hideLoading();
      navigator!.showErrorMassage(FirebaseErrors.somethingWentWrong);
    }
  }
}
