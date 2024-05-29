import 'dart:io';

import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/settings/setting_navigator.dart';
import 'package:chat_app/modules/settings/setting_vm.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
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
  File? image;
    getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? imageGallery = await picker.pickImage(source: ImageSource.gallery);
      if(imageGallery != null) {
        image = File(imageGallery.path);
      }
    setState(() {

    });
/*// Capture a photo.
    final XFile? imageCamera = await picker.pickImage(source: ImageSource.camera);*/

  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          SizedBox(height: 100.h),
          CircleAvatar(
            radius: 60.r,
            child: Stack(
              children: [
                if(image != null)...[
                  Image.file(image!, fit: BoxFit.cover, ),
                ],
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: ()  {
                       getImageFromGallery();
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('settin'),
          ElevatedButton(onPressed: (){
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
