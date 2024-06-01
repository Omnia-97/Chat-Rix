import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.gradient,
    this.colorBg,
    this.borderColor,
    required this.width,
    this.textColor,
  });
  final String buttonText;
  final VoidCallback onTap;
  final Gradient? gradient;
  final Color? colorBg;
  final Color? borderColor;
  final double width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50.h,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: colorBg,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
          gradient: gradient,
        ),
        child: Text(
          buttonText,
          style: AppTextStyles.bodyMedium.copyWith(
            color: textColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
