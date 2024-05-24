import 'package:chat_app/modules/create_account/connector.dart';
import 'package:chat_app/shared/data/errors/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountViewModel extends ChangeNotifier{
  late Connector connector;
   void createUserAccount(
      {required String email,
        required String password,
        required String yourName,
        /*required Function onSuccess,
        required Function onError*/}) async {
    try {
      connector.showLoading();
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      connector.hideLoading();
      connector.showSuccessMassage('Successfully created account');

      //onSuccess();
    } 
    on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        connector.hideLoading();
        connector.showErrorMassage(e.message!);
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {
        connector.hideLoading();
        connector.showErrorMassage(e.message!);
      }
      connector.hideLoading();
      connector.showErrorMassage(e.message!);
    } catch (e) {
      connector.hideLoading();
      connector.showErrorMassage(FirebaseErrors.somethingWentWrong);
    }
  }

}