part of 'user_detail_cubit.dart';

typedef UserData = ({User user, Map<int, Item> items});

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState.loading() = _Loading;
  const factory UserDetailState.loaded(UserData data) = _Loaded;
  const factory UserDetailState.error(Exception error) = _Error;
}
