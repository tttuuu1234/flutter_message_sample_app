import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/pages/top_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/sign_out_controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOutController = ref.watch(signOutProvider);

    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
          child: ListTile(
            title: const Text('ログアウト'),
            trailing: IconButton(
              onPressed: () async {
                await signOutController.signOut();
                await Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const TopPage(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        )
      ],
    );
  }
}
