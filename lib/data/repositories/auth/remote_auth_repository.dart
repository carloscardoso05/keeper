import 'dart:async';

import 'package:keeper/data/repositories/auth/auth_repository.dart';
import 'package:keeper/data/services/auth/auth_http_client.dart';
import 'package:keeper/data/services/auth/auth_local_storage.dart';
import 'package:keeper/domain/dtos/credentials.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/domain/validators/credentials_validator.dart';
import 'package:keeper/utils/validation/lucid_validator_extension.dart';
import 'package:result_dart/result_dart.dart';

class RemoteAuthRepository implements AuthRepository {
  final AuthLocalStorage _authLocalStorage;
  final AuthHttpClient _authHttpClient;

  RemoteAuthRepository(this._authLocalStorage, this._authHttpClient);

  final _streamController = StreamController<User?>.broadcast();

  @override
  AsyncResult<User> getUser() {
    return _authLocalStorage.getUser();
  }

  @override
  AsyncResult<User> login(Credentials credentials) {
    final validator = CredentialsValidator();
    return validator
        .validationResult(credentials)
        .flatMap(_authHttpClient.login)
        .flatMap(_authLocalStorage.saveUser)
        .onSuccess(_streamController.add);
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
