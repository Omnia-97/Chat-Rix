import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(
        color: Color(0xFFe1e7f5),
        size: 28,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFF7C96AB),
        size: 20,
      ),
      unselectedItemColor: Color(0xFF7C96AB),
      selectedItemColor: Color(0xFFe1e7f5),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
