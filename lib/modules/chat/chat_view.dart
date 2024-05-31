import 'dart:io';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/chat/chat_navigator.dart';
import 'package:chat_app/modules/chat/chat_vm.dart';
import 'package:chat_app/modules/chat/widgets/sender_widget.dart';
import 'package:chat_app/modules/layout/layout_view.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
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
    super.initState();
    viewModel.navigator = this;
  }

  File? image;
  void getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      image = File(imageGallery.path);
      await viewModel.sendImageMessage(image!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var roomModel = ModalRoute.of(context)!.settings.arguments as RoomModel;
    var provider = Provider.of<UserProvider>(context, listen: false);
    viewModel.roomModel = roomModel;
    viewModel.userModel = provider.userModel ??
        UserModel(
          id: "",
          userName: '',
          email: '',
        );

    viewModel.readMessages();
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            leadingWidth: 25.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/${roomModel.roomCategoryId}.jpg'),
                ),
                SizedBox(width: 12.w),
                Text(" ${roomModel.roomName} Room",
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 22.sp)),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.person_add,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LayoutView(
                        selectedIndex: provider.currentIndex,
                      ),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot<MessageModel>>(
                stream: viewModel.readMessages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
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
                      return MessageWidget(messageModel: message![index]);
                    },
                    itemCount: message?.length ?? 0,
                  );
                },
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          controller: contentMessageController,
                          fillColor: AppColors.primaryColor,
                          prefixIcon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: AppColors.whiteColor,
                            size: 20,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              getImageFromGallery();
                            },
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.whiteColor,
                              size: 20,
                            ),
                          ),
                          hintText: 'Message',
                          contentPadding: EdgeInsets.symmetric(vertical: 0.h),
                          borderColor: AppColors.primaryColor,
                          radius: 25),
                    ),
                    SizedBox(width: 8.w),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 22.r,
                      child: CircleAvatar(
                        radius: 21.r,
                        backgroundColor: AppColors.primaryColor,
                        child: IconButton(
                          onPressed: () {
                            if (contentMessageController.text.isNotEmpty) {
                              viewModel
                                  .sendMessage(contentMessageController.text);
                            }
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
