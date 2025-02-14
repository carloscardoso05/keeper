import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/data/services/item/item_converter.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:keeper/utils/logger/log.dart';
import 'package:result_dart/result_dart.dart';

part 'transfer_item_state.dart';
part 'transfer_item_cubit.freezed.dart';

class TransferItemCubit extends Cubit<TransferItemState> with Log {
  TransferItemCubit(this.item) : super(TransferItemState.loading());

  Item item;

  final UserRepository _userRepository = getIt.get();
  final ItemConverter _itemConverter = getIt.get();
  final ItemRepository _itemRepository = getIt.get();

  void loadEmployees() async {
    emit(TransferItemState.loading());

    final result = await _userRepository.getEmployees().map<TransferItemData>(
      (employees) => (employees: employees, item: item),
    );

    result.fold(
      (success) => emit(TransferItemState.loaded(success)),
      (failure) => emit(TransferItemState.error(failure)),
    );
  }

  void transferItem(User newHolder) async {
    if (state is! _Loaded) {
      log.w('Cannot transfer item when state is not loaded. State: $state');
      return;
    }

    emit(TransferItemState.loading());

    _itemRepository
        .save(_itemConverter.toDto(item.copyWith(id: newHolder.id)))
        .map<TransferItemData>(
          (savedItem) async => (
            item: savedItem,
            employees: await _userRepository.getEmployees().getOrThrow(),
          ),
        )
        .fold(
          (success) => emit(TransferItemState.loaded(success)),
          (failure) => emit(TransferItemState.error(failure)),
        );
  }
}
