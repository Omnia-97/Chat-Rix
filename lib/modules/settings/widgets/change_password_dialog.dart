import 'dart:ui';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog(
      {super.key,
      required this.onPressed,
      required this.newPasswordController,
      required this.currentPasswordController});
  final VoidCallback onPressed;
  final TextEditingController newPasswordController;
  final TextEditingController currentPasswordController;
  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: AlertDialog(
        backgroundColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.zero,
        actions: [
          SizedBox(
            height: 45.h,
            child: ElevatedButton(
              onPressed: () async {
                widget.onPressed();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.primaryColor),
              child: Text(
                AppStrings.changePassword,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.lightColor),
              ),
            ),
          ),
          SizedBox(
            width: 120.w,
            height: 45.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.primaryColor),
              child: Text(
                AppStrings.cancel,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.lightColor),
              ),
            ),
          ),
        ],
        insetPadding: EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: SizedBox(
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 26.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(AppImages.icChangePassword),
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      AppStrings.changePassword,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  child: CustomTextFormField(
                    courserColor: AppColors.primaryColor,
                    textColor: AppColors.primaryColor,
                    hintText: AppStrings.enterCurrentPassword,
                    controller: widget.currentPasswordController,
                    fillColor: AppColors.primaryColor.withOpacity(0.1),
                    borderColor: AppColors.primaryColor,
                    hintColor: AppColors.primaryColor,
                    suffixIconColor: AppColors.primaryColor,
                    isPassword: true,
                    contentPadding: EdgeInsets.only(
                      bottom: 20.h,
                      left: 20.w,
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'current password is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 50.h,
                  child: CustomTextFormField(
                    courserColor: AppColors.primaryColor,
                    textColor: AppColors.primaryColor,
                    hintText: AppStrings.enterNewPassword,
                    controller: widget.newPasswordController,
                    fillColor: AppColors.primaryColor.withOpacity(0.1),
                    borderColor: AppColors.primaryColor,
                    hintColor: AppColors.primaryColor,
                    suffixIconColor: AppColors.primaryColor,
                    isPassword: true,
                    contentPadding: EdgeInsets.only(
                      bottom: 20.h,
                      left: 20.w,
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'new password is required';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
