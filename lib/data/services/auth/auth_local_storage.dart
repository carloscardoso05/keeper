import 'dart:convert';

import 'package:keeper/data/services/local_storage.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

class AuthLocalStorage {
  final LocalStorage _localStorage;

  AuthLocalStorage(this._localStorage);

  AsyncResult<User> getUser() async {
    return _localStorage
        .get('user')
        .map((json) => User.fromJson(jsonDecode(json)));
  }
}
