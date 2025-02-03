// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferImpl _$$TransferImplFromJson(Map<String, dynamic> json) =>
    _$TransferImpl(
      id: (json['id'] as num).toInt(),
      itemId: (json['itemId'] as num).toInt(),
      requesterId: (json['requesterId'] as num).toInt(),
      destinationId: (json['destinationId'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: $enumDecode(_$TransferStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$TransferImplToJson(_$TransferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'requesterId': instance.requesterId,
      'destinationId': instance.destinationId,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$TransferStatusEnumMap[instance.status]!,
    };

const _$TransferStatusEnumMap = {
  TransferStatus.pending: 'pending',
  TransferStatus.finished: 'finished',
};
