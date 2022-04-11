import 'package:flutter_lovers/common/locator.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/firebase_auth_service.dart';
import 'package:flutter_lovers/services/firestore_db_service.dart';

class UserRepository implements AuthBase {
  AuthBase authBase = locator<FirebaseAuthService>();
  FirestoreDBService firestoreDbService = locator<FirestoreDBService>();

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
      String email, String password) async {
    UserModel? user =
        await authBase.createUserWithEmailAndPassword(email, password);
    if (user != null) {
      await firestoreDbService.saveUser(user);
    }

    return user;
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
          String email, String password) =>
      authBase.signInWithEmailAndPassword(email, password);
}
