import 'package:chat_app/shared/data/errors/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountViewModel extends ChangeNotifier{
   void createUserAccount(
      {required String email,
        required String password,
        required String yourName,
        required Function onSuccess,
        required Function onError}) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        onError(e.message);
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {
        onError(e.message);
      }
      onError(e.message);
    } catch (e) {
      onError(FirebaseErrors.somethingWentWrong);
    }
  }

}