import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:result_dart/result_dart.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState.initial()) {
    loadUsers();
  }

  final UserRepository _userRepository = getIt.get();

  void loadUsers() async {
    emit(UsersState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(UsersState.loaded(result: await _userRepository.getAll()));
  }
}
