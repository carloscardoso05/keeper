import 'dart:convert';
import 'dart:math';

import 'package:keeper/data/services/local_storage.dart';
import 'package:result_dart/result_dart.dart';

abstract class LocalStorageService<T extends Object> {
  String get key => T.toString();
  T Function(Map<String, dynamic> json) get fromJson;

  Future<int> _getNewId() async {
    return (await getAll().getOrThrow()).keys.reduce(max) + 1;
  }

  final LocalStorage _storage = LocalStorage();

  Map<int, T> _entitiesFromMap(Map<int, Map<String, dynamic>> entities) {
    return entities.map(
      (key, value) => MapEntry(key, fromJson(value)),
    );
  }

  AsyncResult<Map<int, T>> getAll() {
    return _storage
        .get(key)
        .map<Map<int, Map<String, dynamic>>>(
          (entitiesJson) => jsonDecode(entitiesJson),
        )
        .map(_entitiesFromMap);
  }

  AsyncResult<T> get(int id) {
    return getAll().flatMap((success) {
      final entity = success[id];
      return entity != null
          ? Success(entity)
          : Failure(Exception('$T with id $id doenst exist'));
    });
  }

  AsyncResult<T> save(T value, [int? id]) {
    return getAll().onSuccess((success) async {
      id = id ?? await _getNewId();
      success[id!] = value;
      _storage.set(key, jsonEncode(success));
    }).pure(value);
  }

  AsyncResult<T> delete(int id) {
    return getAll().flatMap(
      (success) async {
        final removed = success.remove(id);
        await _storage.set(key, jsonEncode(success));
        return removed != null
            ? Success(removed)
            : Failure(Exception('$T with id $id doenst exist'));
      },
    );
  }
}
