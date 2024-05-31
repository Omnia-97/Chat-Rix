import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseUtils {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

  static Future<void> addUserToFireStore(UserModel userModel) {
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);
    return docRef.set(userModel);
  }

  static Future<UserModel?> readUserFromFireStore(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String id = user.uid;
      DocumentSnapshot<UserModel> documentSnapshot =
          await getUsersCollection().doc(id).get();
      return documentSnapshot.data();
    } else {
      return null;
    }
  }

  static CollectionReference<RoomModel> getRoomsCollection() {
    return FirebaseFirestore.instance
        .collection(RoomModel.collectionName)
        .withConverter<RoomModel>(
      fromFirestore: (snapshot, _) {
        final data = snapshot.data();
        if (data != null) {
          return RoomModel.fromJson(data);
        } else {
          throw Exception('Failed to parse RoomModel from Firestore');
        }
      },
      toFirestore: (room, _) {
        return room.toJson();
      },
    );
  }

  static Future<void> addRoomToFireStore(RoomModel roomModel) {
    var collection = getRoomsCollection();
    var docRef = collection.doc();
    roomModel.id = docRef.id;
    return docRef.set(roomModel);
  }

  static Stream<QuerySnapshot<RoomModel>> getRoomFromFireStore() {
    return getRoomsCollection()
        //.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  static CollectionReference<MessageModel> getMessageCollection(String roomId) {
    return getRoomsCollection()
        .doc(roomId)
        .collection(MessageModel.collectionName)
        .withConverter<MessageModel>(
      fromFirestore: (snapshot, _) {
        return MessageModel.fromJson(snapshot.data()!);
      },
      toFirestore: (message, _) {
        return message.toJson();
      },
    );
  }

  static Future<void> addMessageToFireStore(MessageModel messageModel) {
    var collection = getMessageCollection(messageModel.roomId);
    var docRef = collection.doc();
    messageModel.id = docRef.id;
    return docRef.set(messageModel);
  }

  static Stream<QuerySnapshot<MessageModel>> readMessageFromFireStore(
      String roomId) {
    return getMessageCollection(roomId).orderBy('dateTime').snapshots();
  }

  static Future<void> changePassword(String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.updatePassword(newPassword);
  }

  static Future<void> deleteUserAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.delete();
  }
}
