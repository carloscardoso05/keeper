import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:lucid_validation/lucid_validation.dart';

class ItemValidator extends LucidValidator<ItemDto> {
  ItemValidator() {
    ruleFor((item) => item.name.trim(), key: 'name')
        .notEmpty(message: 'O nome do item não pode ser vazio')
        .minLength(
          2,
          message: 'O nome do item deve ter no mínimo 2 caracteres',
        );
  }
}
