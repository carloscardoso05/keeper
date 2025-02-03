import 'dart:async';

import 'package:keeper/data/repositories/auth/auth_repository.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

class RemoteAuthRepository implements AuthRepository {
  final _streamController = StreamController<User?>.broadcast();

  @override
  AsyncResult<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  AsyncResult<User> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Stream<User> userObservable() {
    // TODO: implement userObserver
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
