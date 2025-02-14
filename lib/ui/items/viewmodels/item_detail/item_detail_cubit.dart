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
    : super(
        ItemDetailState.loaded(Success((item: data.item, holder: data.holder))),
      );
}
