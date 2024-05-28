import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/chat/chat_navigator.dart';
import 'package:chat_app/modules/chat/chat_vm.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/components/custom_button.dart';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends BaseView<ChatView, ChatViewModel>
    implements ChatNavigator {
  var contentMessageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var roomModel = ModalRoute.of(context)!.settings.arguments as RoomModel;
    var provider = Provider.of<UserProvider>(context);
    viewModel.roomModel = roomModel;
    viewModel.userModel = provider.userModel!;
    viewModel.readMessages();
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(" ${roomModel.roomName} Room",
                style: AppTextStyles.titleLarge),
          ),
          body: Column(
            children: [
              Expanded(
                  child: StreamBuilder<QuerySnapshot<MessageModel>>(
                stream: viewModel.readMessages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  var message =
                      snapshot.data?.docs.map((doc) => doc.data()).toList();
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(message?[index].content ?? "");
                    },
                    itemCount: message?.length ?? 0,
                  );
                },
              )),
              Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    hintText: 'Enter Message',
                    controller: contentMessageController,
                    fillColor: AppColors.primaryColor,
                  )),
                  CustomButton(
                      colorBg: AppColors.primaryColor,
                      buttonText: 'send',
                      onTap: () {
                        viewModel.sendMessage(contentMessageController.text);
                      },
                      width: 50.w),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  ChatViewModel initViewModel() {
    return ChatViewModel();
  }

  @override
  void clearContentMessage() {
    contentMessageController.clear();
  }
}
