import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserType { employee, manager, admin }

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    required UserType type,
    @Default([]) List<int> itemsIds,
    int? projectId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
