import 'package:result_dart/result_dart.dart';

abstract interface class BaseRepository<Model extends Object,
    Dto extends Object> {
  AsyncResult<Model> get(int id);
  AsyncResult<Map<int, Model>> getAll();
  AsyncResult<Model> save(Dto value);
  AsyncResult<Model> delete(int id);
  Model toModel(Dto dto);
  Dto toDto(Model model);
}
