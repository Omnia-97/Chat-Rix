import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../shared/utils/colors.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Icon(
              Icons.more_vert_rounded,
              color: AppColors.primaryColor,
              size: 30.h,
            ),
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
      ),
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
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_mail,
              ),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
