import 'dart:io';
import 'package:asap/core/repository/storage_repository.dart';
import 'package:asap/features/auth/model/user_model.dart';
import 'package:asap/features/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AsyncValue<void>>(AuthController.new);

final getUserDataProvider = StreamProvider.family((ref, String userId) {
  final user = ref.watch(authControllerProvider.notifier).getUserData(userId);
  return user;
});

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthController extends AsyncNotifier<AsyncValue<void>> {
  late AuthRepository _authRepository;
  late StorageRepository _storageRepository;

  AsyncValue<void> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _storageRepository = ref.watch(storageRepositoryProvider);

    return const AsyncValue.data(null);
  }

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    final user =
        await _authRepository.signInWithEmailAndPassword(email, password);

    user.fold(
        (failure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.message))),
        (userModel) =>
            ref.read(userProvider.notifier).update((state) => userModel));
  }

  void signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    final user =
        await _authRepository.signUpWithEmailAndPassword(email, password);

    user.fold(
        (failure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.message))),
        (userModel) =>
            ref.read(userProvider.notifier).update((state) => userModel));
  }

  Future<void> signOut() async {
    _authRepository.signOut();
  }

  Stream<UserModel> getUserData(uid) {
    return _authRepository.getUserData(uid);
  }

  void updateUser(BuildContext context, String username, File image) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;

    final userId = user!.uid.toString();

    final imageRes = await _storageRepository.storeFile(
        path: '/profileimage', id: userId, file: image);

    imageRes.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))), (r) {
      final user = UserModel(
          uid: userId, username: username, profileImage: r.toString());
      final res = _authRepository.updateUserData(user);
    });
  }
}
