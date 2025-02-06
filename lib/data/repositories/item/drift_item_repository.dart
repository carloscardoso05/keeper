import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/services/item/drift_item_service.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:result_dart/result_dart.dart';

class DriftItemRepository implements ItemRepository {
  final DriftItemService _service;

  DriftItemRepository(this._service);

  @override
  AsyncResult<Item> delete(int id) {
    return _service.delete(id);
  }

  @override
  AsyncResult<Item> get(int id) {
    return _service.get(id);
  }

  @override
  AsyncResult<Map<int, Item>> getAll() {
    return _service.getAll();
  }

  @override
  AsyncResult<Item> save(Item value, [int? id]) {
    return _service.save(value, id);
  }
}
