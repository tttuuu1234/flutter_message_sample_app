import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/controllers/sign_up_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = ref.watch(userNameProvider);
    final emailController = ref.watch(emailProvider);
    final passwordConttoller = ref.watch(passwordProvider);
    final signUpController = ref.watch(signUpProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
            ),
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordConttoller,
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () {
                signUpController.signUp();
              },
              child: const Text('Create an Account'),
            )
          ],
        ),
      ),
    );
  }
}
