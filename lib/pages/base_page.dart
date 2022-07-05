import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/controllers/sign_out_controller.dart';
import 'package:flutter_message_sample_app/pages/top_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOutController = ref.watch(signOutProvider);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Spacer(),
              Text('認証後の画面'),
              Spacer(),
              IconButton(
                onPressed: () async {
                  try {
                    await signOutController.signOut();
                    await Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const TopPage(),
                      ),
                      (route) => false,
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(days: 5),
                        content: Text(e.toString()),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.logout),
              )
            ],
          ),
        ),
      ),
    );
  }
}
