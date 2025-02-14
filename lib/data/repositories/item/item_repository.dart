import 'package:keeper/data/repositories/base_repository.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ItemRepository
    implements BaseRepository<Item, ItemDto> {
  AsyncResult<Map<int, Item>> getByUserId(int userId);
}
