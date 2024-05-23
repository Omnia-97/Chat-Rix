import 'package:chat_app/shared/styles/app_text_styles.dart';
import 'package:chat_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.buttonText, required this.onTap });
  final String buttonText;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
        },
        child: Container(
          height: 50.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            gradient: LinearGradient(colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor.withOpacity(0.5),
            ]),
          ),
          child: Text(buttonText, style: AppTextStyles.bodyMedium,),
        ),);
  }
}
