import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(
        color: AppColors.thirdColor,
        size: 28,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.lightBlueColor,
        size: 20,
      ),
      unselectedItemColor: AppColors.lightBlueColor,
      selectedItemColor: AppColors.thirdColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
