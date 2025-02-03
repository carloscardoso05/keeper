// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: (json['id'] as num).toInt(),
      assetCode: json['assetCode'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      holderId: (json['holderId'] as num?)?.toInt(),
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assetCode': instance.assetCode,
      'name': instance.name,
      'description': instance.description,
      'holderId': instance.holderId,
      'properties': instance.properties,
    };
