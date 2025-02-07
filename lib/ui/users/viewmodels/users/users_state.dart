part of 'users_cubit.dart';

@immutable
sealed class UsersState {
  const UsersState();

  const factory UsersState.initial() = Initial;
  const factory UsersState.loading() = Loading;
  const factory UsersState.loaded(Result<Map<int, User>> result) = Loaded;
}

@immutable
class Initial extends UsersState {
  const Initial();
}

@immutable
class Loading extends UsersState {
  const Loading();
}

@immutable
class Loaded extends UsersState {
  const Loaded(this.result);
  final Result<Map<int, User>> result;
}
