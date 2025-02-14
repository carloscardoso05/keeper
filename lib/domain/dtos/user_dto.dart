import 'package:keeper/domain/entities/user.dart';

class UserDto {
  int? id;
  String name;
  UserType type;

  UserDto({this.id, this.name = '', this.type = UserType.employee});
}
