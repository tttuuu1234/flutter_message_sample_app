import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/controllers/users_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchAllUsers = ref.watch(fetchAllUsersProvider);
    return fetchAllUsers.when(
      data: (result) {
        if (result.users.isEmpty) {
          return const Center(
            child: Text('User not found'),
          );
        }

        return ListView.builder(
          itemCount: result.users.length,
          itemBuilder: ((context, index) {
            final user = result.users[index];

            return Card(
              child: ListTile(
                title: Text(user.name),
                trailing: IconButton(
                  onPressed: () {
                    // todosNotifier.setTitle(todo);
                    // _showTodoEditDialog(
                    //   context,
                    //   todo,
                    //   editTitleEditingController,
                    //   todosNotifier,
                    // );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            );
          }),
        );
      },
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
