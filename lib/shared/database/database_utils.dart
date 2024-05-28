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

  static Future<void> inviteUserToRoom(String roomId, String userId) async {
    var roomDoc = getRoomsCollection().doc(roomId);
    var roomSnapshot = await roomDoc.get();

    if (roomSnapshot.exists) {
      var roomData = roomSnapshot.data();
      if (roomData != null) {
        var room = RoomModel.fromJson(roomData.toJson());
        if (!room.participantIds.contains(userId)) {
          room.participantIds.add(userId);
          await roomDoc.update(room.toJson());
        }
      }
    }
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    var usersCollection = getUsersCollection();
    var querySnapshot =
        await usersCollection.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      return UserModel.fromJson(querySnapshot.docs.first.data().toJson());
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
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
