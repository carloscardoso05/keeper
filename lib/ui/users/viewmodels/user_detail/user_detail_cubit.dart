import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/repositories/project/project_repository.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/project.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:result_dart/result_dart.dart';

part 'user_detail_state.dart';
part 'user_detail_cubit.freezed.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit(this.user) : super(UserDetailState.loading()) {
    loadItems();
  }

  User user;

  final ItemRepository _itemRepository = getIt.get();
  final ProjectRepository _projectRepository = getIt.get();

  void loadItems() async {
    emit(UserDetailState.loading());

    final result = _itemRepository.getByUserId(user.id).flatMap<UserData>((
      items,
    ) {
      if (user.projectId == null) {
        return (items: items, user: user, project: null).toSuccess();
      }
      return _projectRepository.get(user.projectId!).map<UserData>((project) {
        return (items: items, user: user, project: project);
      });
    });

    result.fold(
      (data) => emit(UserDetailState.loaded(data)),
      (error) => emit(UserDetailState.error(error)),
    );
  }
}
