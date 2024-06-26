import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/create_account/create_account_navigator.dart';
import 'package:chat_app/shared/data/errors/firebase_errors.dart';
import 'package:chat_app/shared/database/database_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  void createUserAccount({
    required String email,
    required String password,
    required String yourName,
  }) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        id: credential.user?.uid ?? '',
        email: email,
        userName: yourName,
      );
      DataBaseUtils.addUserToFireStore(userModel).then((value) {
        navigator!.goToHome(userModel);
      });

      navigator!.showSuccessMassage('Successfully created account');
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        navigator!.hideLoading();
        navigator!.showErrorMassage(e.message!);
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {
        navigator!.hideLoading();
        navigator!.showErrorMassage(e.message!);
      }
      navigator!.hideLoading();
      navigator!.showErrorMassage(e.message!);
    } catch (e) {
      navigator!.hideLoading();
      navigator!.showErrorMassage(FirebaseErrors.somethingWentWrong);
    }
  }
}
