import 'dart:ui';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/modules/provider/user_provider.dart';

class AccountDetailsDialog extends StatelessWidget {
  const AccountDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: AlertDialog(
        backgroundColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(AppImages.icUser),
                      color: AppColors.primaryColor,
                      size: 28,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        AppStrings.accountDetails,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'Name: ${provider.userModel?.userName ?? 'Unknown'}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Email: ${provider.userModel?.email ?? 'Unknown'}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                AppStrings.close,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.lightColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
