import 'dart:ui';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    children: [
                      const ImageIcon(
                        AssetImage(AppImages.icPolicy),
                        color: AppColors.primaryColor,
                        size: 28,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          AppStrings.privacyPolicy,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  AppStrings.privacyPolicyDetails,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor.withOpacity(0.6),
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.justify,
                ),
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
