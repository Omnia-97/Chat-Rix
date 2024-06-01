import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.isLeft,
  });
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return isLeft
        ? Container(
            width: 98.w,
            height: 1.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xFFD9D9D9).withOpacity(0.0),
                  const Color(0xFFD9D9D9),
                ],
              ),
            ),
          )
        : Container(
            width: 98.w,
            height: 1.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xFFD9D9D9),
                  const Color(0xFFD9D9D9).withOpacity(0.0),
                ],
              ),
            ),
          );
  }
}
