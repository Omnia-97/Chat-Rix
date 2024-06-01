import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/home/home_navigator.dart';
import 'package:chat_app/shared/database/database_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  Stream<QuerySnapshot<RoomModel>>? roomsStream;
  void getRooms() async {
    try {
      roomsStream = DataBaseUtils.getRoomFromFireStore();
    } catch (e) {
      navigator!.showErrorMassage(e.toString());
    }
  }
}
