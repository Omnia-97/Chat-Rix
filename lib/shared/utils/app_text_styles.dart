import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );
  static TextStyle hintTextStyle = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );
  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}
