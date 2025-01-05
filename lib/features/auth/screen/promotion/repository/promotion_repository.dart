import 'package:asap/features/auth/screen/promotion/model/promotion_model.dart';
import 'package:asap/firebase_options.dart';
import 'package:asap/providers/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final promotionsRepositoryProvider = Provider((ref) =>
    PromotionRepository(firestore: ref.watch(firebaseFireStoreProvider)));

class PromotionRepository {
  final FirebaseFirestore _firestore;

  PromotionRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _promotions =>
      _firestore.collection(FirebaseConstants.promotions);

  Stream<PromotionModel> getPromotions() {
    return _promotions.doc("2gcyqbQs4mQjeCjzxqeV").snapshots().map((event) =>
        PromotionModel.fromJson((event.data() as Map<String, dynamic>)));
  }
}
