import 'dart:convert';

import 'package:keeper/data/services/local_storage.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

const _userKey = '_userKey';

class AuthLocalStorage {
  final LocalStorage _localStorage;

  AuthLocalStorage(this._localStorage);

  AsyncResult<User> getUser() {
    return _localStorage
        .get(_userKey)
        .map((json) => User.fromJson(jsonDecode(json)));
  }

  AsyncResult<User> saveUser(User user) {
    return _localStorage.set(_userKey, jsonEncode(user.toJson())).pure(user);
  }

  AsyncResult<User> removeUser() {
    return _localStorage
        .remove(_userKey)
        .map((userJson) => User.fromJson(jsonDecode(userJson)));
  }
}
