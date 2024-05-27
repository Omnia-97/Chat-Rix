import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.1.w,
      height: 44.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: BorderDirectional(
          start: BorderSide(
            color: AppColors.whiteColor,
            width: 0.3.w,
          ),
          end: BorderSide(
            color: AppColors.whiteColor,
            width: 0.3.w,
          ),
        ),
        borderRadius: BorderRadius.circular(8.85.r),
        gradient: LinearGradient(colors: [
          AppColors.whiteColor.withOpacity(0.22),
          AppColors.whiteColor.withOpacity(0.1),
          AppColors.whiteColor.withOpacity(0.0),
        ]),
      ),
      child: child,
    );
  }
}
