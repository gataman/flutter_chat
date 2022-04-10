import 'package:flutter/material.dart';
import 'package:flutter_lovers/common/locator.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/repository/user_repository.dart';
import 'package:flutter_lovers/services/auth_base.dart';

enum ViewState { idle, busy }

class UserViewModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.idle;
  final UserRepository _userRepository = locator<UserRepository>();
  UserModel? _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel? get user => _user;

  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  UserViewModel() {
    currentUser();
  }

  @override
  Future<UserModel?> currentUser() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("UserViewModel-currentUser: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("UserViewModel-signInAnonymously: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.busy;
      var result = await _userRepository.signOut();
      if (result) {
        _user = null;
        return true;
      } else {
        debugPrint("UserViewModel-signOut: Çıkış yapılamadı");
        return false;
      }
    } catch (e) {
      debugPrint("UserViewModel-signOut: ${e.toString()}");
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInWithGoogle();
      return _user;
    } catch (e) {
      debugPrint("UserViewModel-signInWithGoogle: ${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    debugPrint("createUserWithEmailAndPassword");
    try {
      state = ViewState.busy;
      _user =
          await _userRepository.createUserWithEmailAndPassword(email, password);
      return _user;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    debugPrint("signInWithEmailAndPassword");
    try {
      state = ViewState.busy;
      _user = await _userRepository.signInWithEmailAndPassword(email, password);
      return _user;
    } finally {
      state = ViewState.idle;
    }
  }
}
