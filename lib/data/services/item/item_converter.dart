import 'package:keeper/data/services/converter.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/entities/item.dart';

class ItemConverter implements Converter<Item, ItemDto> {
  @override
  ItemDto toDto(Item model) {
    return ItemDto(
      id: model.id,
      name: model.name,
      holderId: model.holderId,
      assetCode: model.assetCode,
      description: model.description,
    );
  }

  @override
  Item toModel(ItemDto dto) {
    return Item(
      id: dto.id ?? 0,
      name: dto.name,
      holderId: dto.holderId,
      assetCode: dto.assetCode,
      description: dto.description,
    );
  }
}
