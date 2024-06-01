import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/shared/routes/pages_route_name.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({super.key, required this.roomModel});
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    var dt = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PagesRouteName.chat, arguments: roomModel);
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w, bottom: 6.h),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'assets/images/${roomModel.roomCategoryId}.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
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
                    ],
                  ),
                  const Spacer(),
                  Text(
                    date.substring(12),
                    style: AppTextStyles.hintTextStyle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
