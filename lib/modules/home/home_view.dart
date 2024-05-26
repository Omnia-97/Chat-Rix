import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/home/home_navigator.dart';
import 'package:chat_app/modules/home/home_vm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseView<HomeView,HomeViewModel> implements HomeNavigator{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          FirebaseAuth.instance.signOut();
          setState(() {

          });
        }, child: Text('Home')),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
