import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ReceiverWidget extends StatelessWidget {
  ReceiverWidget({
    super.key,
    required this.messageModel,
  });
  MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
          bottomRight: Radius.circular(18.r),
        ),
      ),
      child: Column(
        children: [
          Text(
            messageModel.content,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
          Text(
            messageModel.timestamp.toString(),
            style: const TextStyle(color:AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
