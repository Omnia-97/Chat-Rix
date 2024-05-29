import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/create_account/widgets/custom_container.dart';
import 'package:chat_app/modules/create_account/widgets/social_container.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/modules/sign_in/sign_in_navigator.dart';
import 'package:chat_app/modules/sign_in/sign_in_vm.dart';
import 'package:chat_app/shared/components/custom_button.dart';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../shared/database/database_utils.dart';
/*
void initDynamicLinks() async {
  FirebaseDynamicLinks.instance.onLink(
    onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        var isLoggedIn = FirebaseAuth.instance.currentUser != null;
        if (isLoggedIn) {
          // User is logged in, add them to the room
          String? roomId = deepLink.queryParameters['roomId'];
          if (roomId != null) {
            String userId = FirebaseAuth.instance.currentUser!.uid;
            await DataBaseUtils.inviteUserToRoom(roomId, userId);
          }
        } else {
          // User is not logged in, redirect to login/signup page
          // and handle adding to room after login/signup
          redirectToLoginPage(deepLink);
        }
      }
    },
    onError: (OnLinkErrorException e) async {
      print('onLinkError: ${e.message}');
    },
  );
}

*//*void redirectToLoginPage(Uri deepLink, BuildContext context) {
  // Navigate to the login page, pass the deepLink so you can handle it after login
 Navigator.pushNamed(MaterialPageRoute(builder: (context) {

 },));

}*/

class SignInView extends StatefulWidget {
  const SignInView({super.key,});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends BaseView<SignInView, SignInViewModel>
    implements SignInNavigator {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
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
            AppImages.signInScreen,
            fit: BoxFit.fill,
            width: mediaQuery.width,
            height: mediaQuery.height,
          ),
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 55.w,
                    right: 51.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 270.h),
                      Text(
                        AppStrings.welcomeBack,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleLarge,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          AppStrings.missed,
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
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 18.h,
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
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          AppStrings.forgotPassword,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomButton(
                        width: double.infinity,
                        gradient:  LinearGradient(colors: [
                          AppColors.primaryColor,
                          AppColors.secondaryColor.withOpacity(0.5),
                        ]),
                        buttonText: AppStrings.signIn,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            viewModel.signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomContainer(
                            isLeft: true,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            AppStrings.orContinueWith,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          const CustomContainer(
                            isLeft: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
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
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.dontHaveAccount,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PagesRouteName.signUp);
                            },
                            child: Text(
                              AppStrings.register,
                              style: AppTextStyles.hintTextStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.whiteColor),
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
  SignInViewModel initViewModel() {
    return SignInViewModel();
  }

  @override
  void goToHome(UserModel userModel) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    provider.userModel = userModel;
    Navigator.pushReplacementNamed(
      context,
      PagesRouteName.layout,
    );
  }
}
