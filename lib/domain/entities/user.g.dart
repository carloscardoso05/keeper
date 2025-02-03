// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      itemsIds: (json['itemsIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$UserTypeEnumMap[instance.type]!,
      'itemsIds': instance.itemsIds,
      'projectId': instance.projectId,
    };

const _$UserTypeEnumMap = {
  UserType.employee: 'employee',
  UserType.manager: 'manager',
  UserType.admin: 'admin',
};
