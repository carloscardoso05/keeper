import 'package:drift/drift.dart';
import 'package:keeper/data/services/drift/local_db.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

class DriftUserService {
  final LocalDb _db;

  $$UserTableTableTableManager get manager => _db.managers.userTable;

  DriftUserService(this._db);

  MapEntry<int, User> _entryFromDb(UserTableData data) {
    return MapEntry(data.id, toModel(data));
  }

  AsyncResult<User> delete(int id) async {
    try {
      return get(id).onSuccess((_) => manager.filter((f) => f.id(id)).delete());
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<User> get(int id) async {
    try {
      return (await manager
              .filter((item) => item.id(id))
              .getSingle()
              .then(toModel))
          .toSuccess();
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Map<int, User>> getAll() async {
    try {
      return (await manager.get().then(
              (items) => Map<int, User>.fromEntries(items.map(_entryFromDb))))
          .toSuccess();
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<User> save(User value, int? id) async {
    try {
      final data = await manager.createReturning(
        (user) => user(
          id: Value.absentIfNull(id),
          name: value.name,
          type: value.type,
        ),
        mode: InsertMode.replace,
      );
      return Success(toModel(data));
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  UserTableData toDb(User model) {
    return UserTableData.fromJson(model.toJson());
  }

  User toModel(UserTableData data) {
    return User.fromJson(data.toJson());
  }
}
