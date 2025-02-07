import 'package:keeper/data/repositories/base_repository.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class UserRepository implements BaseRepository<User> {
  AsyncResult<Map<int, User>> getEmployees();
}
