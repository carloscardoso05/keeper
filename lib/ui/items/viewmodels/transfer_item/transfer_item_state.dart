part of 'transfer_item_cubit.dart';

typedef TransferItemData = ({Item item, Map<int, User> employees});

@freezed
class TransferItemState with _$TransferItemState {
  const factory TransferItemState.loading() = _Loading;
  const factory TransferItemState.loaded(TransferItemData data) = _Loaded;
  const factory TransferItemState.error(Exception error) = _Error;
}
