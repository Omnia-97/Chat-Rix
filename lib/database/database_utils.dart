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
}
