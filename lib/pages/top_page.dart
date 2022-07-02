import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MessageApp'),
            TextButton(
              onPressed: () {},
              child: const Text('新規登録'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('ログイン'),
            )
          ],
        ),
      ),
    );
  }
}
