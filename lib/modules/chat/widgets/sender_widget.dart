import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/modules/chat/widgets/receiver_widget.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SenderWidget extends StatelessWidget {
  SenderWidget({
    super.key,
    required this.messageModel,
  });
  MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    int ts = messageModel.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: IntrinsicWidth(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding:  EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.0.w),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              bottomRight: Radius.circular(18.r),
              bottomLeft: Radius.circular(18.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${messageModel.senderName} 👋🏻",
                style: AppTextStyles.hintTextStyle,
              ),
              SizedBox(height: 5.h,),
              Text(
                messageModel.content,
                style: AppTextStyles.bodyMedium,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  date.substring(12),
                  style: AppTextStyles.hintTextStyle.copyWith(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  MessageWidget({
    super.key,
    required this.messageModel,
  });
  MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return provider.userModel!.id == messageModel.senderId
        ? SenderWidget(messageModel: messageModel)
        : ReceiverWidget(
            messageModel: messageModel,
          );
  }
}
