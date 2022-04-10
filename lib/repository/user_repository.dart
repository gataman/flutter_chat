import 'package:flutter_lovers/common/locator.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/firebase_auth_service.dart';

class UserRepository implements AuthBase {
  AuthBase authBase = locator<FirebaseAuthService>();

  @override
  Future<UserModel?> currentUser() => authBase.currentUser();

  @override
  Future<UserModel?> signInAnonymously() => authBase.signInAnonymously();

  @override
  Future<bool> signOut() => authBase.signOut();

  @override
  Future<UserModel?> signInWithGoogle() => authBase.signInWithGoogle();

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
          String email, String password) =>
      authBase.createUserWithEmailAndPassword(email, password);

  @override
  Future<UserModel?> signInWithEmailAndPassword(
          String email, String password) =>
      authBase.signInWithEmailAndPassword(email, password);
}
