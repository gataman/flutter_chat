import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FakeAuthService implements AuthBase {
  String userID = "1212121212121212";
  @override
  Future<UserModel?> currentUser() async {
    return UserModel(userID: userID);
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    return UserModel(userID: userID);
  }

  @override
  Future<bool> signOut() async {
    return true;
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    return UserModel(userID: userID);
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    return UserModel(userID: userID);
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    return UserModel(userID: userID);
  }
}
