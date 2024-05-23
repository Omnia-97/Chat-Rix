import 'package:chat_app/shared/styles/app_text_styles.dart';
import 'package:chat_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {required this.hintText,
      this.suffixIcon,
      this.isPassword,
      this.controller,
      this.keyboardType,
      this.onTap,
      this.onChanged,
      this.onValidate,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.onSaved,
      this.prefixIcon,
      this.contentPadding,
      super.key});
  String hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  EdgeInsetsGeometry? contentPadding;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap, onEditingComplete;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final String? Function(String?)? onValidate;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      validator: widget.onValidate,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ?? false ? obscureText : !obscureText,
      cursorColor: AppColors.whiteColor,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18.sp,
      ),
      mouseCursor: SystemMouseCursors.click,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ?? EdgeInsets.only(bottom: 10.h),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.whiteColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.white, width: 0.3.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.3.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.3.w,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.3.w,
          ),
        ),
        prefixIconColor: AppColors.whiteColor,
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
