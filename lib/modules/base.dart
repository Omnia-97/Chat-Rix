import 'package:chat_app/shared/data/errors/firebase_errors.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  T? navigator;
}

abstract class BaseNavigator {
  void showLoading();
  void hideLoading();
  void showErrorMassage(String? errorMassage);
  void showSuccessMassage(String? successMassage);
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;
  VM initViewModel();
  @override
  void initState() {
    viewModel = initViewModel();
    super.initState();
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showErrorMassage(String? errorMassage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(AppStrings.error),
            content: Text(errorMassage ?? FirebaseErrors.somethingWentWrong),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  AppStrings.tryAgain,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  AppStrings.cancel,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          );
        });
  }

  @override
  void showLoading() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  @override
  void showSuccessMassage(String? successMassage) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              bottom: 15.0,
              left: 20.0,
              right: 20.0,
              child: Material(
                type: MaterialType.transparency,
                child: AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor.withOpacity(0.5),
                      ]),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text(
                      successMassage ?? 'Done successfully',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
