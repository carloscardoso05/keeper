import 'package:keeper/data/repositories/base_repository.dart';
import 'package:keeper/utils/data/services/local_storage_service.dart';
import 'package:result_dart/result_dart.dart';

mixin LocalStorageRepository<T extends Object> implements BaseRepository<T> {
  LocalStorageService<T> get storage;

  @override
  AsyncResult<T> delete(int id) {
    return storage.delete(id);
  }

  @override
  AsyncResult<T> get(int id) {
    return storage.get(id);
  }

  @override
  AsyncResult<Map<int, T>> getAll() {
    return storage.getAll();
  }

  @override
  AsyncResult<T> save(T value, [int? id]) {
    return storage.save(value, id);
  }
}
