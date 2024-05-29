import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomItem extends StatelessWidget {
  RoomItem({super.key, required this.roomModel});
  RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, PagesRouteName.chat, arguments: roomModel);
      },
      child: Padding(
        padding:  EdgeInsets.only(top:10.h,left: 20.w,right: 20.w, bottom: 6.h),
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(55.r),
                child: Image(
                  width: 55.w,
                  image:
                       AssetImage('assets/images/${roomModel.roomCategoryId}.jpg'),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      roomModel.roomDescription,
                      style: AppTextStyles.hintTextStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    Divider(
                      thickness: 4.h,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
