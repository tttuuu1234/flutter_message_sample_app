import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/firebase/auth/auth_service.dart';
import 'package:flutter_message_sample_app/repository/users_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final userNameProvider = StateProvider<TextEditingController>((ref) {
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
    final usersRepository = _reader(usersRepositoryImpleProvider);
    try {
      final credential = await authService.signUp(
        emailAddress: email,
        password: password,
      );
      await usersRepository.create(
        uid: credential.user!.uid,
        name: userName,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        message: e.message,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
