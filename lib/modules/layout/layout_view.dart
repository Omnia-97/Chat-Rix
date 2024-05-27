import 'package:chat_app/modules/provider/user_provider.dart';
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
          preferredSize: Size.zero, // Adjust the height of the line
          child: Container(
            height: 0.3.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              boxShadow: [
                BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.7),
                    blurRadius: 1)
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        title: Text('ChatRix',
            style: AppTextStyles.titleLarge
                .copyWith(color: AppColors.primaryColor, fontSize: 30)),
      ),
      body: provider.tabs[provider.currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        highlightElevation: 20.0,
        elevation: 10.0,
        onPressed: () {},
        child: const Align(
          alignment: AlignmentDirectional.center,
          child: Icon(
            Icons.group_add_rounded,
            size: 26,
            color: Color(0xFFe1e7f5),
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
