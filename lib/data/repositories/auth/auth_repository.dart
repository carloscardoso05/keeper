import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  AsyncResult<User> login();
  AsyncResult<Unit> logout();
  AsyncResult<User> getUser();
  Stream<User?> userObservable();
  void dispose();
}
