import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../controllers/sign_in_controller.dart';
import '../providers.dart';
import 'base_page.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailProvider);
    final passwordConttoller = ref.watch(passwordProvider);
    final signInController = ref.watch(signInProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Please enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Please enter your password',
              ),
              controller: passwordConttoller,
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () async {
                try {
                  final userCredential = await signInController.signIn();
                  if (userCredential.user == null) {
                    return;
                  }

                  await Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const BasePage(),
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
              child: const Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
}
