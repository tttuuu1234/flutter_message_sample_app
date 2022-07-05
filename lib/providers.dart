import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cloudFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final emailProvider = StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final passwordProvider = StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

