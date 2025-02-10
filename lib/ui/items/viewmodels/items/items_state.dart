part of 'items_cubit.dart';

@immutable
sealed class ItemsState {
  const ItemsState();

  const factory ItemsState.initial() = Initial;
  const factory ItemsState.loading() = Loading;
  const factory ItemsState.loaded(Result<Map<int, Item>> items) = Loaded;
}

@immutable
class Initial extends ItemsState {
  const Initial();
}

@immutable
class Loading extends ItemsState {
  const Loading();
}

@immutable
class Loaded extends ItemsState {
  final Result<Map<int, Item>> result;

  const Loaded(this.result);
}
