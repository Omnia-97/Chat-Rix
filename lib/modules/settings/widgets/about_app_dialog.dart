import 'dart:ui';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: AlertDialog(
        backgroundColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(30.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: SizedBox(
          height: 320.h,
          child: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 22.h, top: 26.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(AppImages.icAbout),
                      color: AppColors.primaryColor,
                      size: 28,
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Text(
                      AppStrings.aboutChatRix,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                 AppStrings.aboutAppDetails,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor.withOpacity(0.6),
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
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
        ],
      ),
    );
  }
}
