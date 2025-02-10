import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/services/item/drift_item_service.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
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
  AsyncResult<Item> save(ItemDto value, [int? id]) {
    return _service.save(toModel(value), id);
  }

  @override
  ItemDto toDto(Item model) {
    return ItemDto(
      id: model.id,
      name: model.name,
      description: model.description,
      assetCode: model.assetCode,
      holderId: model.holderId,
    );
  }

  @override
  Item toModel(ItemDto dto) {
    return Item(
      id: dto.id ?? 0,
      name: dto.name,
      description: dto.description,
      assetCode: dto.assetCode,
      holderId: dto.holderId,
    );
  }
}
