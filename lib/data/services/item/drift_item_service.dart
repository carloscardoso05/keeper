import 'package:drift/drift.dart';
import 'package:keeper/data/services/drift/local_db.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:result_dart/result_dart.dart';

class DriftItemService {
  final LocalDb _db;

  $$ItemTableTableTableManager get manager => _db.managers.itemTable;

  DriftItemService(this._db);

  MapEntry<int, Item> _entryFromDb(ItemTableData data) {
    return MapEntry(data.id, toModel(data));
  }

  AsyncResult<Item> delete(int id) async {
    try {
      return get(id).onSuccess((_) => manager.filter((f) => f.id(id)).delete());
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Item> get(int id) async {
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

  AsyncResult<Map<int, Item>> getAll() async {
    try {
      return (await manager.get().then(
              (items) => Map<int, Item>.fromEntries(items.map(_entryFromDb))))
          .toSuccess();
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Item> save(Item value, int? id) async {
    try {
      final data = await manager.createReturning(
        (item) => item(
          id: Value.absentIfNull(id),
          assetCode: value.assetCode,
          name: value.name,
          description: Value(value.description),
          holderId: Value(value.holderId),
        ),
        mode: InsertMode.replace,
      );
      return Success(toModel(data));
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  ItemTableData toDb(Item model) {
    return ItemTableData(
      id: model.id,
      assetCode: model.assetCode,
      name: model.name,
      description: model.description,
      holderId: model.holderId,
    );
  }

  Item toModel(ItemTableData data) {
    return Item(
      id: data.id,
      assetCode: data.assetCode,
      name: data.name,
      description: data.description,
      holderId: data.holderId,
    );
  }
}
