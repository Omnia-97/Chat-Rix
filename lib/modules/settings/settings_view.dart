import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/settings/setting_navigator.dart';
import 'package:chat_app/modules/settings/setting_vm.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseView<SettingsView,SettingViewModel> implements SettingNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          Text('settin'),
          ElevatedButton(onPressed: (){
            viewModel.signOut();
          }, child: Text('Sign out')),
        ],
      ),
    );
  }

  @override
  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, PagesRouteName.signIn, (route) => false);
  }

  @override
  SettingViewModel initViewModel() {
   return SettingViewModel();
  }

}
