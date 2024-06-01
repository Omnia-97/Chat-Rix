import 'dart:ui';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: AlertDialog(
        backgroundColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.zero,
        actions: [
          ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            child: Text(
              AppStrings.delete,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.lightColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                side: const BorderSide(color: AppColors.primaryColor),
              ),
              backgroundColor: AppColors.lightColor,
            ),
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
        insetPadding: EdgeInsets.all(
          10.r,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        content: SizedBox(
          height: 145.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 16.w,
            ),
            child: SizedBox(
              width: 345.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(AppImages.icDeleteAccount),
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        AppStrings.deleteAccount,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppStrings.deleteAccountSure,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primaryColor.withOpacity(
                        0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
