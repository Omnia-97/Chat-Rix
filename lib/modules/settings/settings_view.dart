import 'dart:io';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/modules/settings/setting_navigator.dart';
import 'package:chat_app/modules/settings/setting_vm.dart';
import 'package:chat_app/modules/settings/widgets/about_app_dialog.dart';
import 'package:chat_app/modules/settings/widgets/change_password_dialog.dart';
import 'package:chat_app/modules/settings/widgets/custom_divider.dart';
import 'package:chat_app/modules/settings/widgets/custom_row_widget.dart';
import 'package:chat_app/modules/settings/widgets/privacy_policy_dialog.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'widgets/delete_account_dialog.dart';

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

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
        ),
        child: SingleChildScrollView(
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
                        radius: 80.r,
                        backgroundImage: FileImage(
                          image!,
                        ),
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
              SizedBox(
                height: 28.h,
              ),
              CustomRowWidget(
                text: 'Account',
                hintText: 'Info about account',
                imagePath: AppImages.icUser,
              ),
              const CustomDivider(),
              CustomRowWidget(
                text: 'Change Password',
                hintText: 'Update your password',
                imagePath: AppImages.icChangePassword,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangePasswordDialog(
                        currentPasswordController: currentPasswordController,
                        newPasswordController: newPasswordController,
                        onPressed: () async {
                          await viewModel.changePassword(
                            newPasswordController.text,
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const CustomDivider(),
              CustomRowWidget(
                text: 'Privacy Policy',
                hintText: 'Details about privacy policy',
                imagePath: AppImages.icPolicy,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const PrivacyPolicyDialog();
                    },
                  );
                },
              ),
              const CustomDivider(),
              CustomRowWidget(
                text: 'Delete Account',
                hintText: 'Remove account permanently',
                imagePath: AppImages.icDeleteAccount,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteAccountDialog(
                        onPressed: () {
                          viewModel.deleteAccount();
                        },
                      );
                    },
                  );
                },
              ),
              const CustomDivider(),
              CustomRowWidget(
                text: 'About Us',
                hintText: 'Info about app',
                imagePath: AppImages.icAbout,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AboutAppDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingViewModel initViewModel() {
    return SettingViewModel();
  }

  @override
  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PagesRouteName.signIn,
      (route) => false,
    );
  }
}
