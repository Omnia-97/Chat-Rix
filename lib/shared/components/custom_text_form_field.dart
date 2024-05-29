import 'package:chat_app/shared/utils/colors.dart';
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
        this.fillColor,
        this.borderColor,
        this.hintColor,
        this.textColor,
        this.courserColor,
        this.radius,
      super.key});
  String hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color? fillColor;
  Color? borderColor;
  Color? hintColor;
  Color? textColor;
  Color? courserColor;
  double? radius;
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
      cursorColor: widget.courserColor ?? AppColors.whiteColor,
      style: TextStyle(
        color: widget.textColor ?? AppColors.whiteColor,
        fontSize: 18.sp,
      ),
      textInputAction: TextInputAction.next,
      mouseCursor: SystemMouseCursors.click,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor ?? Colors.transparent,
        contentPadding: widget.contentPadding ?? EdgeInsets.only(bottom: 10.h),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: widget.hintColor ?? AppColors.whiteColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r ),
          borderSide: BorderSide(color: widget.borderColor ?? AppColors.whiteColor, width: 0.3.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          borderSide: BorderSide(
            color:widget.borderColor ?? AppColors.whiteColor,
            width: 0.3.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.whiteColor,
            width: 0.3.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.whiteColor,
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
