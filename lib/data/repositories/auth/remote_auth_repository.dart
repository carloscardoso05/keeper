import 'dart:async';

import 'package:keeper/data/repositories/auth/auth_repository.dart';
import 'package:keeper/data/services/auth/auth_local_storage.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this._authLocalStorage);

  final _streamController = StreamController<User?>.broadcast();

  final AuthLocalStorage _authLocalStorage;

  @override
  AsyncResult<User> getUser() {
    return _authLocalStorage.getUser();
  }

  @override
  AsyncResult<User> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> logout() {
    return _authLocalStorage
        .removeUser()
        .onSuccess(
          (_) => _streamController.add(null),
        )
        .pure(unit);
  }

  @override
  Stream<User?> userObservable() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
