import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/services/db_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(UserModel user) async {
    _firestore.collection("users").doc(user.userID).set(user.toMap());
    return true;
  }
}
