import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel?> currentUser() async {
    try {
      User? user = _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      debugPrint("Error: Current User ${e.toString()}");
    }
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    try {
      var result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(result.user);
    } catch (e) {
      debugPrint("Error: SignInAnonymously- ${e.toString()}");
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("Error: SignOut- ${e.toString()}");
      return false;
    }
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var result = await _firebaseAuth.signInWithCredential(credential);

      if (googleUser != null) {
        return _userFromFirebase(result.user);
      } else {
        debugPrint("Google user bulunamadı");
        return null;
      }
    } catch (e) {
      debugPrint("Error: signInWithGoogle- ${e.toString()}");
    }
  }

  UserModel? _userFromFirebase(User? user) {
    if (user != null) {
      return UserModel(
          userID: user.uid,
          name: user.displayName,
          email: user.email,
          photoUrl: user.photoURL);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return UserModel(exception: e);
      /*
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

       */
    } catch (e) {
      return UserModel(exception: e);
    }
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return UserModel(exception: e);
      /*
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

       */
    } catch (e) {
      return UserModel(exception: e);
    }
  }
}
