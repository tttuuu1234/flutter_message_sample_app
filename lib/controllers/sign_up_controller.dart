import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/firebase/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final emailProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final passwordProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final signUpProvider = Provider<SignUpController>((ref) {
  return SignUpController(ref.read);
});

class SignUpController {
  SignUpController(this._reader);

  late final Reader _reader;
  Future<void> signUp() async {
    final userName = _reader(userNameProvider).text;
    final email = _reader(emailProvider).text;
    final password = _reader(passwordProvider).text;
    final authService = _reader(authServiceProvider);
    try {
      await authService.signUp(emailAddress: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
