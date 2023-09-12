import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sipinggang/model/user_data.dart';

class UsersDatabase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionPath = 'users';

  UsersDatabase();

  Future createUser(
    UserData user,
  ) async {
    try {
      await firestore
          .collection(collectionPath)
          .doc(user.docUid)
          .set(user.toData());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<DocumentSnapshot<UserData>> getUser(String docUid) {
    return firestore
        .collection(collectionPath)
        .doc(docUid)
        .withConverter<UserData>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return UserData.fromData(snapshot);
      },
      toFirestore: (UserData model, _) {
        return model.toData();
      },
    ).get();
  }

  Future<QuerySnapshot<UserData>> getUsers() {
    return firestore.collection(collectionPath).withConverter<UserData>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return UserData.fromData(snapshot);
      },
      toFirestore: (UserData model, _) {
        return model.toData();
      },
    ).get();
  }

  Stream<QuerySnapshot<UserData>> streamUsers() {
    return firestore.collection(collectionPath).withConverter<UserData>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return UserData.fromData(snapshot);
      },
      toFirestore: (UserData model, _) {
        return model.toData();
      },
    ).snapshots();
  }

  Future updateUser(String docUid, Map<String, dynamic> data) async {
    try {
      await firestore.collection(collectionPath).doc(docUid).update(data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future deleteUser(String docUid) async {
    try {
      await firestore.collection(collectionPath).doc(docUid).delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> checkUserExist({
    required String phone,
  }) async {
    QuerySnapshot<Map<String, dynamic>> result = await firestore
        .collection(collectionPath)
        .where('phone', isEqualTo: phone)
        .limit(1)
        .get();
    if (result.docs.isNotEmpty) {
      return result.docs.first.exists;
    } else {
      return false;
    }
  }
}
