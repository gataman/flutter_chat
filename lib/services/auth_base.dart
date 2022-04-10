import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_lovers/model/user/user_model.dart';

abstract class AuthBase {
  Future<UserModel?> currentUser();
  Future<UserModel?> signInAnonymously();
  Future<bool> signOut();
  Future<UserModel?> signInWithGoogle();
  Future<UserModel?> signInWithEmailAndPassword(String email, String password);
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password);
}
