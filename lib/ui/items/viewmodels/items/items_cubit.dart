import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:keeper/utils/logger/log.dart';
import 'package:result_dart/result_dart.dart';

part 'items_state.dart';
part 'items_cubit.freezed.dart';

class ItemsCubit extends Cubit<ItemsState> with Log {
  ItemsCubit() : super(const ItemsState.initial()) {
    loadItems();
    stream.listen(
      (state) => state.whenOrNull(
        loaded: (result) => result.onFailure(log.e),
      ),
    );
  }

  final ItemRepository _itemRepository = getIt.get();
  final UserRepository _userRepository = getIt.get();

  void loadItems() async {
    emit(const ItemsState.loading());
    final AsyncResult<ItemsData> result = _itemRepository.getAll().flatMap(
          (items) => _userRepository.getEmployees().map<ItemsData>(
                (employees) => (
                  items: items,
                  holders: employees,
                ),
              ),
        );
    emit(ItemsState.loaded(await result));
  }

  void saveItem(ItemDto item, [int? id]) async {
    if (state is! _Loaded) {
      log.w('Cannot save item when state is not loaded. Current state: $state');
      return;
    }
    var result = (state as _Loaded).data;
    emit(ItemsState.loading());
    result = await result
        .toAsyncResult()
        .flatMap((itemsData) => _itemRepository.save(item, id).map(
              (newItem) => itemsData..items[newItem.id] = newItem,
            ));
    emit(ItemsState.loaded(result));
  }

  void deleteItem(int id) async {
    if (state is! _Loaded) {
      log.w(
          'Cannot delete item when state is not loaded. Current state: $state');
      return;
    }
    var result = (state as _Loaded).data;
    emit(ItemsState.loading());
    result = await result
        .toAsyncResult()
        .flatMap((itemsData) => _itemRepository.delete(id).map(
              (_) => itemsData..items.remove(id),
            ));
    emit(ItemsState.loaded(result));
  }
}
