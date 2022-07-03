import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  final _instance = FirebaseAuth.instance;

  /// 認証情報登録
  Future<UserCredential> signUp({
    required String emailAddress,
    required String password,
  }) async {
    try {
      return await _instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    } catch (e) {
      throw Exception('Account create failed');
    }
  }

  /// 認証済みユーザー情報の取得
  User? fetchCurrentUser() {
    return _instance.currentUser;
  }
}
