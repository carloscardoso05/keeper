import 'package:keeper/data/repositories/base_repository.dart';
import 'package:keeper/domain/dtos/user_dto.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class UserRepository implements BaseRepository<User, UserDto> {
  AsyncResult<Map<int, User>> getEmployees();
}
