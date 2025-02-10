import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState.initial()) {
    loadUsers();
  }

  static final Logger log = getIt.get();

  final UserRepository _userRepository = getIt.get();

  void loadUsers() async {
    emit(UsersState.loading());
    emit(UsersState.loaded(await _userRepository.getAll()));
  }

  void saveUser(User user, [int? id]) async {
    if (state is! Loaded) {
      log.d('Cannot save user when state is not loaded. Current state: $state');
      return;
    }
    var result = (state as Loaded).result;
    emit(UsersState.loading());
    result = await result
        .toAsyncResult()
        .flatMap((users) => _userRepository.save(user, id).map(
              (newUser) => users..[newUser.id] = newUser,
            ));
    emit(UsersState.loaded(result));
  }

  void deleteUser(int id) async {
    if (state is! Loaded) {
      log.w('Cannot save user when state is not loaded. Current state: $state');
      return;
    }
    var result = (state as Loaded).result;
    emit(UsersState.loading());
    result = await result
        .toAsyncResult()
        .flatMap((users) => _userRepository.delete(id).map(
              (_) => users..remove(id),
            ));
    emit(UsersState.loaded(result));
  }
}
