class UserModel {
  String? userID;
  String? name;
  String? email;
  String? photoUrl;
  Object? exception;

  UserModel(
      {this.userID, this.name, this.email, this.photoUrl, this.exception});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'photoUrl': photoUrl
    };
  }
}
