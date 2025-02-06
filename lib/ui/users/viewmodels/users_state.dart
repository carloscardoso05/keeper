part of 'users_cubit.dart';

@freezed
sealed class UsersState with _$UsersState {
  const factory UsersState.initial() = Initial;
  const factory UsersState.loading() = Loading;
  const factory UsersState.loaded({
    required Result<Map<int, User>> result,
  }) = Loaded;
}
