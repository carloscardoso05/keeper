import 'package:keeper/data/repositories/base_repository.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/entities/item.dart';

abstract interface class ItemRepository implements BaseRepository<Item, ItemDto> {}
