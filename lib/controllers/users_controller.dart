import 'package:flutter_message_sample_app/repository/users_repository.dart';
import 'package:flutter_message_sample_app/states/user/user_state.dart';
import 'package:flutter_message_sample_app/states/users/users_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchAllUsersProvider = FutureProvider<UsersState>((ref) async {
  return ref.read(usersControllerProvider.notifier).fetchAll();
});

final usersControllerProvider =
    StateNotifierProvider<UsersContoller, UsersState>((ref) {
  return UsersContoller(ref.read);
});

class UsersContoller extends StateNotifier<UsersState> {
  UsersContoller(this._reader) : super(const UsersState());

  late Reader _reader;

  Future<UsersState> fetchAll() async {
    final res = await _reader(usersRepositoryImpleProvider).fetchAll();
    final users = res.map((e) => UserState(id: e.id, name: e.name)).toList();
    return state.copyWith(users: users);
  }
}
