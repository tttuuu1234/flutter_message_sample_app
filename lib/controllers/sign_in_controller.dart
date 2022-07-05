import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_message_sample_app/firebase/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final signInProvider = Provider<SignInController>((ref) {
  return SignInController(ref.read);
});

class SignInController {
  SignInController(this._reader);
  late final Reader _reader;

  Future<UserCredential> signIn() async {
    try {
      final email = _reader(emailProvider).text;
      final password = _reader(passwordProvider).text;
      return await _reader(authServiceProvider).signIn(
        email: email,
        password: password,
      );
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
