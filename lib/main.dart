import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/firebase/auth/auth_service.dart';
import 'package:flutter_message_sample_app/firebase_options.dart';
import 'package:flutter_message_sample_app/pages/base_page.dart';
import 'package:flutter_message_sample_app/pages/top_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final authService = ref.watch(authServiceProvider);
          final currentUser = authService.fetchCurrentUser();
          if (currentUser == null) {
            return const TopPage();
          }

          return const BasePage();
        },
      ),
    );
  }
}
