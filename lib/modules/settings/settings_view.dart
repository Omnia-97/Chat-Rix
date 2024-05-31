import 'dart:io';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/modules/settings/setting_navigator.dart';
import 'package:chat_app/modules/settings/setting_vm.dart';
import 'package:chat_app/modules/settings/widgets/custom_divider.dart';
import 'package:chat_app/modules/settings/widgets/custom_row_widget.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseView<SettingsView, SettingViewModel>
    implements SettingNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  File? image;
  getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      image = File(imageGallery.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h,),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  if (image != null) ...[
                    CircleAvatar(
                      backgroundImage: FileImage(image!,),
                      radius: 80.r,
                     /* child: Image.file(
                        image!,
                        fit: BoxFit.fill,
                      ),*/
                    ),
                  ] else ...[
                    CircleAvatar(
                      backgroundColor: AppColors.lightColor,
                      radius: 80.r,
                      child: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                        size: 75.r,
                      ),
                    ),
                  ],
                  Positioned(
                    top: 108.h,
                child: InkWell(
                      onTap: () {
                        getImageFromGallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 24.r,
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.lightColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Text(
              provider.userModel?.userName ?? 'Unknown',
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.primaryColor,
                fontSize: 20.sp,
              ),
            ),
            Text(
              provider.userModel?.email ?? 'Unknown',
              style: AppTextStyles.hintTextStyle.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
           /* SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 28.w),
              child: Container(
                height: 0.3.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.7),
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ),*/
            SizedBox(
              height: 28.h,
            ),

            const CustomRowWidget(
              text: 'Account',
              hintText: 'Info about account', imagePath: AppImages.icUser,
            ),
            const CustomDivider(),
            const CustomRowWidget(
              text: 'Change Password',
              hintText: 'Update your password',
              imagePath: AppImages.icChangePassword,
            ),
            const CustomDivider(),
            const CustomRowWidget(
              text: 'Privacy Policy',
              hintText: 'Details about privacy policy', imagePath: AppImages.icPolicy,
            ),
            const CustomDivider(),
            const CustomRowWidget(
              text: 'Delete Account',
              hintText: 'Remove account permanently', imagePath: AppImages.icDeleteAccount,
            ),
            const CustomDivider(),
            const CustomRowWidget(
              text: 'About Us',
              hintText: 'Info about app', imagePath: AppImages.icAbout,
            ),


          ],
        ),
      ),
    );
  }

  @override
  SettingViewModel initViewModel() {
    return SettingViewModel();
  }
}
