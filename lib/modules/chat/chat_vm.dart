import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/chat/chat_navigator.dart';
import 'package:chat_app/shared/database/database_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late RoomModel roomModel;
  late UserModel userModel;
  void sendMessage(String content) {
    MessageModel messageModel = MessageModel(
      roomId: roomModel.id,
      senderId: userModel.id,
      senderName: userModel.userName,
      content: content,
      timestamp: Timestamp.now(),
    );
    DataBaseUtils.addMessageToFireStore(messageModel).then(
      (value) => navigator!.clearContentMessage(),
    );
  }
  Stream<QuerySnapshot<MessageModel>> readMessages() {
    return DataBaseUtils.readMessageFromFireStore(roomModel.id);
  }
}