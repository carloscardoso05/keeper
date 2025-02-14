import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/utils/logger/log.dart';
import 'package:result_dart/result_dart.dart';

part 'item_detail_cubit.freezed.dart';
part 'item_detail_state.dart';

class ItemDetailCubit extends Cubit<ItemDetailState> with Log {
  ItemDetailCubit(ItemData data) : super(ItemDetailState.loaded(Success(data)));

  void refresh(ItemData data) {
    emit(ItemDetailState.loaded(Success(data)));
  }
}
