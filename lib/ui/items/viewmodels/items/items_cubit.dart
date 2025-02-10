import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/main.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(const Initial()) {
    loadItems();
  }

  final Logger log = getIt.get();

  final ItemRepository _repository = getIt.get();

  void loadItems() async {
    emit(const ItemsState.loading());
    emit(ItemsState.loaded(await _repository.getAll()));
  }

  void saveItem(ItemDto item, [int? id]) async {
    if (state is! Loaded) {
      log.w('Cannot save item when state is not loaded. Current state: $state');
      return;
    }
    var result = (state as Loaded).result;
    emit(ItemsState.loading());
    result = await result
        .toAsyncResult()
        .flatMap((items) => _repository.save(item, id).map(
              (newItem) => items..[newItem.id] = newItem,
            ));
    emit(ItemsState.loaded(result));
  }

  void deleteItem(int id) async {
    if (state is! Loaded) {
      log.w(
          'Cannot delete item when state is not loaded. Current state: $state');
      return;
    }
    var result = (state as Loaded).result;
    emit(ItemsState.loading());
    result = await result
        .toAsyncResult()
        .flatMap((items) => _repository.delete(id).map(
              (_) => items..remove(id),
            ));
    emit(ItemsState.loaded(result));
  }
}
