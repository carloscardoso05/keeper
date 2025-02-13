part of 'item_detail_cubit.dart';

typedef ItemData = ({
  Item item,
  User? holder,
});

@freezed
class ItemDetailState with _$ItemDetailState {
  const factory ItemDetailState.loading() = _Loading;
  const factory ItemDetailState.loaded(Result<ItemData> result) = _Loaded;
}
