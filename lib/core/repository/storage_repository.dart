import 'package:asap/core/failure.dart';
import 'package:asap/core/type_defs.dart';
import 'package:asap/providers/firebase_providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:fpdart/fpdart.dart';

final storageRepositoryProvider = Provider((ref) =>
    StorageRepository(firebaseStorage: ref.watch(firebaseStoreProvider)));

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile(
      {required String path, required String id, required File? file}) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);
      UploadTask uploadTask;
      uploadTask = ref.putFile(file!);
      final snapshot = await uploadTask;
      return right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
