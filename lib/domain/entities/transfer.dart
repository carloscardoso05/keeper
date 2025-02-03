import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer.freezed.dart';
part 'transfer.g.dart';

enum TransferStatus { pending, finished }

@freezed
class Transfer with _$Transfer {
  factory Transfer({
    required int id,
    required int itemId,
    required int requesterId,
    required int? destinationId,
    required DateTime createdAt,
    required TransferStatus status,
  }) = _Transfer;

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      _$TransferFromJson(json);
}
