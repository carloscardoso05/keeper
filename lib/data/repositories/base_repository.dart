import 'package:result_dart/result_dart.dart';

abstract interface class BaseRepository<T extends Object> {
  AsyncResult<T> get(int id);
  AsyncResult<Map<int, T>> getAll();
  AsyncResult<T> save(T value, [int? id]);
  AsyncResult<T> delete(int id);
}
