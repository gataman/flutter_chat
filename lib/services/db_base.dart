import 'package:flutter_lovers/model/user/user_model.dart';

abstract class DBBase {
  Future<bool> saveUser(UserModel user);
}
