part of 'items_cubit.dart';

typedef ItemsData = ({
  Map<int, Item> items,
  Map<int, User> holders,
});

@freezed
sealed class ItemsState with _$ItemsState {
  const factory ItemsState.initial() = _Initial;
  const factory ItemsState.loading() = _Loading;
  const factory ItemsState.loaded(Result<ItemsData> data) = _Loaded;
}
