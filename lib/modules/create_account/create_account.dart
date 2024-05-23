import 'package:chat_app/modules/create_account/widgets/custom_container.dart';
import 'package:chat_app/shared/components/custom_button.dart';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/styles/app_strings.dart';
import 'package:chat_app/shared/styles/app_text_styles.dart';
import 'package:chat_app/shared/styles/colors.dart';
import 'package:chat_app/shared/styles/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});
  String emailPattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  String passPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static const String routeName = 'create Account Page';
  var formKey = GlobalKey<FormState>();
  var yourNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.createAccountScreen),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 51.w, right: 52.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 270.h),
                  Text(
                    AppStrings.createAccount,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleLarge,
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  Text(
                    AppStrings.yourName,
                    style: AppTextStyles.hintTextStyle,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextFormField(
                    hintText: 'yourName',
                    controller: yourNameController ,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 18.5.w, left: 21.w),
                      child: Image.asset(
                        AppImages.icPerson,
                        width: 17.39.w,
                        height: 16.72.h,
                      ),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'your name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    AppStrings.email,
                    style: AppTextStyles.hintTextStyle,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextFormField(
                    hintText: 'yourname@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 18.5.w, left: 21.w),
                      child: Image.asset(
                        AppImages.icEmail,
                        width: 19.w,
                        height: 15.h,
                      ),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'email address is required';
                      }
                      var regexp = RegExp(emailPattern);
                      if (!regexp.hasMatch(value)) {
                        return 'Invalid Email , please Enter a valid one';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    AppStrings.password,
                    style: AppTextStyles.hintTextStyle,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextFormField(
                    hintText: 'Your Password',
                    isPassword: true,
                    controller: passwordController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 18.5.w, left: 21.w),
                      child: Image.asset(
                        AppImages.icPassword,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'password is required';
                      }
                      var regexp = RegExp(passPattern);
                      if (!regexp.hasMatch(value)) {
                        return AppStrings.validatePassword;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    AppStrings.confirmPassword,
                    style: AppTextStyles.hintTextStyle,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextFormField(
                    hintText: 'Your Confirm Password',
                    isPassword: true,
                    controller: confirmPasswordController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 18.5.w, left: 21.w),
                      child: Image.asset(
                        AppImages.icPassword,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'confirm password is required';
                      }
                      if (value != passwordController.text) {
                        return 'password does not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  CustomButton(
                    buttonText: AppStrings.signUp,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('object');
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomContainer(
                        isLeft: true,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Text(
                        AppStrings.orSignUpWith,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      const CustomContainer(
                        isLeft: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                        child: SvgPicture.asset(
                          AppImages.icGoogle,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 58.1.w,
                        height: 44.h,
                        padding: EdgeInsets.only(
                          top: 5.h,
                        ),
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
                        child: SvgPicture.asset(
                          AppImages.icApple,
                          width: 32.w,
                          height: 32.h,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 58.1.w,
                        height: 44.h,
                        padding: EdgeInsets.only(
                          top: 8.h,
                        ),
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
                        child: SvgPicture.asset(
                          AppImages.icFaceBook,
                          width: 35.w,
                          height: 35.h,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
