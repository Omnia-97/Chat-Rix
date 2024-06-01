import 'dart:io';

import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/chat/chat_navigator.dart';
import 'package:chat_app/shared/database/database_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late RoomModel roomModel;
  late UserModel userModel;

  void sendMessage(String content) {
    MessageModel messageModel = MessageModel(
      roomId: roomModel.id,
      senderId: userModel.id,
      senderName: userModel.userName,
      content: content,
      dateTime: DateTime.now().microsecondsSinceEpoch,
    );
    DataBaseUtils.addMessageToFireStore(messageModel).then(
      (value) => navigator!.clearContentMessage(),
    );
  }

  Future<void> sendImageMessage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('chat_images').child(fileName);
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {});
      String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

      MessageModel messageModel = MessageModel(
        roomId: roomModel.id,
        senderId: userModel.id,
        senderName: userModel.userName,
        content: imageUrl, // Storing image URL as content
        dateTime: DateTime.now().microsecondsSinceEpoch,
      );
      await DataBaseUtils.addMessageToFireStore(messageModel);
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Stream<QuerySnapshot<MessageModel>> readMessages() {
    return DataBaseUtils.readMessageFromFireStore(roomModel.id);
  }
}
