import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/sign_in/sign_in_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends BaseView<SignInView, SignInViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(),
    );
  }

  @override
  SignInViewModel initViewModel() {
    return SignInViewModel();
  }
}
