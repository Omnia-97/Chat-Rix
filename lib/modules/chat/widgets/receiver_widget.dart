import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReceiverWidget extends StatelessWidget {
  ReceiverWidget({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    bool isImage = messageModel.content.startsWith('https://');
    int ts = messageModel.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);
    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: IntrinsicWidth(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.0.w),
          decoration: BoxDecoration(
            color: Color(0xFFe9edf1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
              bottomRight: Radius.circular(18.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${messageModel.senderName} ✨",
                style: AppTextStyles.hintTextStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              isImage
                  ? Image.network(
                messageModel.content,
                width: 150.w,
                height: 150.h,
                fit: BoxFit.cover,
              )
                  : Text(
                messageModel.content,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  date.substring(12),
                  style: AppTextStyles.hintTextStyle.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
