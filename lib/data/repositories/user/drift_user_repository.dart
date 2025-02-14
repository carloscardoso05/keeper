import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/data/services/user/drift_user_service.dart';
import 'package:keeper/domain/dtos/user_dto.dart';

import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

class DriftUserRepository implements UserRepository {
  final DriftUserService _service;

  const DriftUserRepository(this._service);

  @override
  AsyncResult<User> delete(int id) {
    return _service.delete(id);
  }

  @override
  AsyncResult<User> get(int id) {
    return _service.get(id);
  }

  @override
  AsyncResult<Map<int, User>> getAll() {
    return _service.getAll();
  }

  @override
  AsyncResult<User> save(UserDto value, [int? id]) {
    return _service.save(toModel(value), id);
  }

  @override
  AsyncResult<Map<int, User>> getEmployees() {
    return getAll().map(
      (users) =>
          users..removeWhere((id, user) => user.type != UserType.employee),
    );
  }

  @override
  UserDto toDto(User model) {
    return UserDto(
      id: model.id,
      name: model.name,
      type: model.type,
    );
  }

  @override
  User toModel(UserDto dto) {
    return User(
      id: dto.id ?? 0,
      name: dto.name,
      type: dto.type,
    );
  }
}
