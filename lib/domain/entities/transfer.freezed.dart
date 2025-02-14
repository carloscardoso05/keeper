// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Transfer _$TransferFromJson(Map<String, dynamic> json) {
  return _Transfer.fromJson(json);
}

/// @nodoc
mixin _$Transfer {
  int get id => throw _privateConstructorUsedError;
  int get itemId => throw _privateConstructorUsedError;
  int get requesterId => throw _privateConstructorUsedError;
  int? get destinationId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  TransferStatus get status => throw _privateConstructorUsedError;

  /// Serializes this Transfer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferCopyWith<Transfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) then) =
      _$TransferCopyWithImpl<$Res, Transfer>;
  @useResult
  $Res call({
    int id,
    int itemId,
    int requesterId,
    int? destinationId,
    DateTime createdAt,
    TransferStatus status,
  });
}

/// @nodoc
class _$TransferCopyWithImpl<$Res, $Val extends Transfer>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? requesterId = null,
    Object? destinationId = freezed,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            itemId:
                null == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as int,
            requesterId:
                null == requesterId
                    ? _value.requesterId
                    : requesterId // ignore: cast_nullable_to_non_nullable
                        as int,
            destinationId:
                freezed == destinationId
                    ? _value.destinationId
                    : destinationId // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as TransferStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransferImplCopyWith<$Res>
    implements $TransferCopyWith<$Res> {
  factory _$$TransferImplCopyWith(
    _$TransferImpl value,
    $Res Function(_$TransferImpl) then,
  ) = __$$TransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int itemId,
    int requesterId,
    int? destinationId,
    DateTime createdAt,
    TransferStatus status,
  });
}

/// @nodoc
class __$$TransferImplCopyWithImpl<$Res>
    extends _$TransferCopyWithImpl<$Res, _$TransferImpl>
    implements _$$TransferImplCopyWith<$Res> {
  __$$TransferImplCopyWithImpl(
    _$TransferImpl _value,
    $Res Function(_$TransferImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? requesterId = null,
    Object? destinationId = freezed,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(
      _$TransferImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        itemId:
            null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int,
        requesterId:
            null == requesterId
                ? _value.requesterId
                : requesterId // ignore: cast_nullable_to_non_nullable
                    as int,
        destinationId:
            freezed == destinationId
                ? _value.destinationId
                : destinationId // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as TransferStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferImpl implements _Transfer {
  _$TransferImpl({
    required this.id,
    required this.itemId,
    required this.requesterId,
    required this.destinationId,
    required this.createdAt,
    required this.status,
  });

  factory _$TransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferImplFromJson(json);

  @override
  final int id;
  @override
  final int itemId;
  @override
  final int requesterId;
  @override
  final int? destinationId;
  @override
  final DateTime createdAt;
  @override
  final TransferStatus status;

  @override
  String toString() {
    return 'Transfer(id: $id, itemId: $itemId, requesterId: $requesterId, destinationId: $destinationId, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.destinationId, destinationId) ||
                other.destinationId == destinationId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    itemId,
    requesterId,
    destinationId,
    createdAt,
    status,
  );

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      __$$TransferImplCopyWithImpl<_$TransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferImplToJson(this);
  }
}

abstract class _Transfer implements Transfer {
  factory _Transfer({
    required final int id,
    required final int itemId,
    required final int requesterId,
    required final int? destinationId,
    required final DateTime createdAt,
    required final TransferStatus status,
  }) = _$TransferImpl;

  factory _Transfer.fromJson(Map<String, dynamic> json) =
      _$TransferImpl.fromJson;

  @override
  int get id;
  @override
  int get itemId;
  @override
  int get requesterId;
  @override
  int? get destinationId;
  @override
  DateTime get createdAt;
  @override
  TransferStatus get status;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
