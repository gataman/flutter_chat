import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userID;
  String? name;
  String? email;
  String? photoUrl;
  Object? exception;

  UserModel(
      {this.userID, this.name, this.email, this.photoUrl, this.exception});
}
