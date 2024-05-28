import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/create_new_room/create_new_room_navigator.dart';
import 'package:chat_app/shared/database/database_utils.dart';

class CreateNewRoomViewModel extends BaseViewModel<CreateNewRoomNavigator> {
  void createRoom(
      {required String roomName,
      required String roomDescription,
      required String roomCategoryId,
      required String userId, required List<String> participantIds,}) {
    RoomModel roomModel = RoomModel(
        userId: userId,
        roomName: roomName,
        roomDescription: roomDescription,
        roomCategoryId: roomCategoryId,
        participantIds: participantIds,);
    navigator!.showLoading();
    DataBaseUtils.addRoomToFireStore(roomModel).then((value) => {
      navigator!.hideLoading(),
      navigator!.goToHome(),
    }).catchError((error){
      navigator!.showErrorMassage(error.toString());
    });
  }
}
