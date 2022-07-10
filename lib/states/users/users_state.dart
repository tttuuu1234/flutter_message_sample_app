import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_state.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    @Default(<UserState>[]) List<UserState> users,
  }) = _UsersState;
}
