import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_message_sample_app/firebase/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signOutProvider = Provider<SignOutController>((ref) {
  return SignOutController(ref.read);
});

class SignOutController {
  SignOutController(this._reader);
  late final Reader _reader;

  Future<void> signOut() async {
    try {
      await _reader(authServiceProvider).signOut();
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
