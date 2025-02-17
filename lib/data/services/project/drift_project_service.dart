import 'package:drift/drift.dart';
import 'package:keeper/data/services/drift/local_db.dart';
import 'package:keeper/domain/entities/project.dart';
import 'package:result_dart/result_dart.dart';

class DriftProjectService {
  final LocalDb _db;

  $$ProjectTableTableTableManager get manager => _db.managers.projectTable;

  DriftProjectService(this._db);

  MapEntry<int, Project> _entryFromDb(ProjectTableData data) {
    return MapEntry(data.id, toModel(data));
  }

  AsyncResult<Project> delete(int id) async {
    try {
      return get(id).onSuccess((_) => manager.filter((f) => f.id(id)).delete());
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Project> get(int id) async {
    try {
      return (await manager
          .filter((item) => item.id(id))
          .getSingle()
          .then(toModel)).toSuccess();
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Map<int, Project>> getAll() async {
    try {
      return (await manager.get().then(
        (items) => Map<int, Project>.fromEntries(items.map(_entryFromDb)),
      )).toSuccess();
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Project> save(Project value, int? id) async {
    try {
      final data = await manager.createReturning(
        (project) => project(
          id: Value.absentIfNull(id),
          name: value.name,
          address: value.address,
          startDate: value.startDate,
          endDate: value.endDate,
          status: value.status,
          responsibleId: value.responsibleId,
        ),
        mode: InsertMode.replace,
      );
      return Success(toModel(data));
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Project toModel(ProjectTableData data) {
    return Project(
      id: data.id,
      name: data.name,
      address: data.address,
      startDate: data.startDate,
      endDate: data.endDate,
      status: data.status,
      responsibleId: data.responsibleId,
    );
  }
}
