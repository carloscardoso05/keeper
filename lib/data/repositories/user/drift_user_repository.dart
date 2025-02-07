import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/data/services/user/drift_user_service.dart';

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
  AsyncResult<User> save(User value, [int? id]) {
    return _service.save(value, id);
  }

  @override
  AsyncResult<Map<int, User>> getEmployees() {
    return getAll().map(
      (users) =>
          users..removeWhere((id, user) => user.type != UserType.employee),
    );
  }
}
