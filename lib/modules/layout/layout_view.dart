import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/layout/layout_navigator.dart';
import 'package:chat_app/modules/layout/layout_vm.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../shared/utils/colors.dart';

class LayoutView extends StatefulWidget {
  LayoutView({super.key, this.selectedIndex});
  int? selectedIndex;

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends BaseView<LayoutView, LayoutViewModel>
    implements LayoutNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              offset: const Offset(0, 40),
              color: AppColors.primaryColor,
              iconColor: AppColors.primaryColor,
              surfaceTintColor: AppColors.primaryColor,
              onSelected: (value) async {
                if (value == 'Logout') {
                  viewModel.signOut();
                }
              },
              itemBuilder: (BuildContext context) {
                return ['Logout'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  );
                }).toList();
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
              height: 0.3.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.7),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: AppColors.whiteColor,
          title: Text(
            AppStrings.appName,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.primaryColor,
              fontSize: 30.sp,
            ),
          ),
        ),
        body: provider.tabs[provider.currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: Colors.white,
              width: 4,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, PagesRouteName.createRoom);
          },
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Icon(
              Icons.group_add_rounded,
              size: 26.w,
              color: AppColors.thirdColor,
            ),
          ),
        ),
        /* floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          highlightElevation: 20.0.h,
          elevation: 10.0,
          onPressed: () {
            Navigator.pushNamed(context, PagesRouteName.createRoom);
          },
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Icon(
              Icons.group_add_rounded,
              size: 26.w,
              color: AppColors.thirdColor,
            ),
          ),
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 14.sp,
          unselectedFontSize: 12.sp,
          currentIndex: provider.currentIndex,
          onTap: provider.changeCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.groups,
              ),
              label: 'Rooms',
            ),
            /*BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_mail,
              ),
              label: 'Add Room',
            ),*/
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
        context, PagesRouteName.signIn, (route) => false);
  }

  @override
  LayoutViewModel initViewModel() {
    return LayoutViewModel();
  }
}
