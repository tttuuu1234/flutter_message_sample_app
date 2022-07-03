import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_message_sample_app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UsersRepository {
  Future<void> create({required String uid, required String name});
}

final usersRepositoryImpleProvider = Provider<UsersRepository>((ref) {
  return UsersRepositoryImple(ref.read);
});

class UsersRepositoryImple implements UsersRepository {
  UsersRepositoryImple(this._reader);

  late final Reader _reader;

  @override
  Future<void> create({required String uid, required String name}) async {
    try {
      final firestore = _reader(cloudFirestoreProvider);
      await firestore.collection('users').doc(uid).set({
        'name': name,
      });
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: e.plugin,
        message: e.message,
      );
    }
  }
}
