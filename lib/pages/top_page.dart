import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/pages/sign_in_page.dart';
import 'package:flutter_message_sample_app/pages/sign_up_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SignUpPage(),
                  ),
                );
              },
              child: const Text('Sign up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SignInPage(),
                  ),
                );
              },
              child: const Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
}
