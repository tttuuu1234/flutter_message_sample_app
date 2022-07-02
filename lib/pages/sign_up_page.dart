import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            TextFormField(),
            const Gap(10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create an Account'),
            )
          ],
        ),
      ),
    );
  }
}
