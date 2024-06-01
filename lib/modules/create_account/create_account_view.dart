import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/create_account/create_account_navigator.dart';
import 'package:chat_app/modules/create_account/create_account_vm.dart';
import 'package:chat_app/modules/create_account/widgets/custom_container.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/components/custom_button.dart';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'widgets/social_container.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});
  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState
    extends BaseView<CreateAccountView, CreateAccountViewModel>
    implements CreateAccountNavigator {
  var formKey = GlobalKey<FormState>();
  var yourNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            AppImages.createAccountScreen,
            fit: BoxFit.fill,
            width: mediaQuery.width,
            height: mediaQuery.height,
          ),
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: AppColors.whiteColor),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 51.w,
                    right: 52.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 170.h),
                      Text(
                        AppStrings.createAccount,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleLarge,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          AppStrings.happy,
                          style: AppTextStyles.hintTextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
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
                        controller: yourNameController,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            right: 18.5.w,
                            left: 21.w,
                          ),
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
                          padding: EdgeInsets.only(
                            right: 18.5.w,
                            left: 21.w,
                          ),
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
                          var regexp = RegExp(AppStrings.emailPattern);
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
                          var regexp = RegExp(AppStrings.passPattern);
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
                        width: double.infinity,
                        gradient: LinearGradient(colors: [
                          AppColors.primaryColor,
                          AppColors.secondaryColor.withOpacity(0.5),
                        ]),
                        buttonText: AppStrings.signUp,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            viewModel.createUserAccount(
                              email: emailController.text,
                              password: passwordController.text,
                              yourName: yourNameController.text,
                            );
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
                          SocialContainer(
                            child: SvgPicture.asset(
                              AppImages.icGoogle,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          SocialContainer(
                            child: SvgPicture.asset(
                              AppImages.icApple,
                              width: 32.w,
                              height: 32.h,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          SocialContainer(
                            child: SvgPicture.asset(
                              AppImages.icFaceBook,
                              width: 35.w,
                              height: 35.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }

  @override
  void goToHome(UserModel userModel) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    provider.userModel = userModel;
    Navigator.pushNamedAndRemoveUntil(
        context, PagesRouteName.layout, (route) => false);
  }
}
