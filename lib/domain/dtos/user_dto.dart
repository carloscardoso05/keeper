import 'package:keeper/domain/entities/user.dart';

class UserDto {
  int? id;
  String name;
  UserType type;
  late List<int> itemsIds;

  UserDto({
    this.id,
    this.name = '',
    this.type = UserType.employee,
    List<int>? itemsIds,
  }) {
    this.itemsIds = itemsIds ?? [];
  }
}
