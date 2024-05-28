import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/modules/chat/widgets/receiver_widget.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SenderWidget extends StatelessWidget {
  SenderWidget({
    super.key,
    required this.messageModel,
  });
  MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding:  EdgeInsets.only(right: 5.w, top: 10.h, bottom: 10.h, left: 90.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              bottomRight: Radius.circular(18.r),
              bottomLeft: Radius.circular(18.r),
            ),
          ),
          child: Column(
            children: [
              Text(
                messageModel.content,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                messageModel.timestamp.toString(),
                style: const TextStyle(color: Colors.white),
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
