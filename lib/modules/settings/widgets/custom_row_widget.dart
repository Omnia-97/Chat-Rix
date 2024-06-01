import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.hintText,
    this.onTap,
  });
  final String imagePath;
  final String text;
  final String hintText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(imagePath),
                  color: AppColors.primaryColor,
                  size: 28,
                ),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      hintText,
                      style: AppTextStyles.hintTextStyle.copyWith(
                        color: AppColors.primaryColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
