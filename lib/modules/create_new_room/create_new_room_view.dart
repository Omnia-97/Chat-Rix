import 'package:chat_app/models/room_category_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/create_new_room/create_new_room_navigator.dart';
import 'package:chat_app/modules/create_new_room/create_new_room_vm.dart';
import 'package:chat_app/modules/provider/user_provider.dart';
import 'package:chat_app/shared/components/custom_button.dart';
import 'package:chat_app/shared/components/custom_text_form_field.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateNewRoomView extends StatefulWidget {
  const CreateNewRoomView({super.key});

  @override
  State<CreateNewRoomView> createState() => _CreateNewRoomViewState();
}

class _CreateNewRoomViewState
    extends BaseView<CreateNewRoomView, CreateNewRoomViewModel>
    implements CreateNewRoomNavigator {
  var formKey = GlobalKey<FormState>();
  var roomNameController = TextEditingController();
  var roomDescriptionController = TextEditingController();
  var categories = RoomCategoryModel.getCategories();
  late RoomCategoryModel roomCategoryModel;
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    roomCategoryModel = categories.first;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var provider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            AppImages.roomBg,
            fit: BoxFit.fill,
            width: mediaQuery.width,
            height: mediaQuery.height,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 55.h,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20.w,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                'Hi ${provider.userModel?.userName ?? 'Unknown'} 👋🏻',
                                style: AppTextStyles.titleLarge.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Text(
                              'Start your new room!',
                              style: AppTextStyles.titleLarge.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 170.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w, right: 40.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              AppStrings.createNewRoom,
                              style: AppTextStyles.titleLarge.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 26.sp),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppStrings.roomName,
                            style: AppTextStyles.hintTextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextFormField(
                            hintText: 'Enter room name',
                            courserColor: AppColors.primaryColor,
                            controller: roomNameController,
                            fillColor: AppColors.primaryColor.withOpacity(0.1),
                            borderColor: AppColors.primaryColor,
                            hintColor: AppColors.primaryColor,
                            textColor: AppColors.primaryColor,
                            contentPadding: EdgeInsets.only(
                              bottom: 20.h,
                              left: 20.w,
                            ),
                            onValidate: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'room name is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppStrings.roomCategory,
                            style: AppTextStyles.hintTextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 0.3.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.primaryColor.withOpacity(0.1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<RoomCategoryModel>(
                                  dropdownColor: AppColors.whiteColor,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  ),
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(8.r),
                                  padding:
                                      EdgeInsets.only(left: 18.w, right: 18.w),
                                  isExpanded: true,
                                  value: roomCategoryModel,
                                  items: categories
                                      .map(
                                        (category) =>
                                            DropdownMenuItem<RoomCategoryModel>(
                                          value: category,
                                          child: Row(
                                            children: [
                                              Text(
                                                category.categoryImage,
                                                style: AppTextStyles
                                                    .hintTextStyle
                                                    .copyWith(
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                category.categoryName,
                                                style: AppTextStyles
                                                    .hintTextStyle
                                                    .copyWith(
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value == null) return;
                                    roomCategoryModel = value;
                                    setState(() {});
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppStrings.roomDescription,
                            style: AppTextStyles.hintTextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextFormField(
                            courserColor: AppColors.primaryColor,
                            textColor: AppColors.primaryColor,
                            hintText: 'Enter room description',
                            controller: roomDescriptionController,
                            fillColor: AppColors.primaryColor.withOpacity(0.1),
                            borderColor: AppColors.primaryColor,
                            hintColor: AppColors.primaryColor,
                            contentPadding: EdgeInsets.only(
                              bottom: 20.h,
                              left: 20.w,
                            ),
                            onValidate: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'room description is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 44.h,
                          ),
                          CustomButton(
                            width: double.infinity,
                            buttonText: AppStrings.create,
                            colorBg: AppColors.primaryColor,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                viewModel.createRoom(
                                  roomName: roomNameController.text,
                                  roomDescription:
                                      roomDescriptionController.text,
                                  roomCategoryId: roomCategoryModel.id,
                                  participantIds: [
                                    FirebaseAuth.instance.currentUser!.uid
                                  ],
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CreateNewRoomViewModel initViewModel() {
    return CreateNewRoomViewModel();
  }

  @override
  void goToHome() {
    Navigator.pop(context);
  }
}
