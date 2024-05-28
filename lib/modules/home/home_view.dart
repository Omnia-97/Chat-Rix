import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/home/home_navigator.dart';
import 'package:chat_app/modules/home/home_vm.dart';
import 'package:chat_app/shared/utils/app_strings.dart';
import 'package:chat_app/shared/utils/app_text_styles.dart';
import 'package:chat_app/shared/utils/colors.dart';
import 'package:chat_app/shared/utils/images_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseView<HomeView, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    viewModel.getRooms();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.roomsStream == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else {
            return StreamBuilder<QuerySnapshot<RoomModel>>(
              stream: viewModel.roomsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                      ),
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Image.asset(
                            AppImages.roomEmpty,
                            width: 370.w,
                          )),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          AppStrings.noRooms,
                          style: AppTextStyles.hintTextStyle.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                var rooms = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    var room = rooms[index].data();
                    return ListTile(
                      title: Text(room.roomName),
                      subtitle: Text(room.roomDescription),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
