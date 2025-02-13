import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/services/item/item_converter.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:keeper/utils/logger/log.dart';
import 'package:result_dart/result_dart.dart';

part 'item_detail_state.dart';
part 'item_detail_cubit.freezed.dart';

class ItemDetailCubit extends Cubit<ItemDetailState> with Log {
  ItemDetailCubit(ItemData data)
      : super(ItemDetailState.loaded(
          Success((
            item: data.item,
            holder: data.holder,
          )),
        ));

  final ItemConverter _itemConverter = getIt.get();
  final ItemRepository _itemRepository = getIt.get();

  void transferItem(User newHolder) async {
    if (state is! _Loaded) {
      log.w('Cannot transfer item when state is not loaded. State: $state');
      return;
    }
    emit(ItemDetailState.loading());

    final result = (state as _Loaded)
        .result
        .toAsyncResult()
        .map((data) => data.item.copyWith(holderId: newHolder.id))
        .flatMap((item) => _itemRepository.save(_itemConverter.toDto(item)))
        .map<ItemData>((item) => (
              item: item,
              holder: newHolder,
            ));

    emit(ItemDetailState.loaded(await result));
  }
}
