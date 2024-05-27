import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/home/home_navigator.dart';
import 'package:chat_app/modules/home/home_vm.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseView<HomeView, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
        ),
        Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              AppImages.roomEmpty,
              width: 370.w,
            )),
        Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            AppStrings.noRooms,
            style: AppTextStyles.hintTextStyle.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
