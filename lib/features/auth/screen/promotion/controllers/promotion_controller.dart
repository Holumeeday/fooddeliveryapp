import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/promotion_model.dart';
import '../repository/promotion_repository.dart';


final promotionsControllerProvider =
    AsyncNotifierProvider<PromotionsController, AsyncValue<void>>(
        PromotionsController.new);

final getPromotions = StreamProvider((ref) {
  final promotions =
      ref.watch(promotionsControllerProvider.notifier).getPromotions();
  return promotions;
});

class PromotionsController extends AsyncNotifier<AsyncValue<void>> {
  late PromotionRepository _promotionRepository;

  AsyncValue<void> build() {
    _promotionRepository = ref.watch(promotionsRepositoryProvider);
    return const AsyncValue.data(null);
  }

  Stream<PromotionModel> getPromotions() {
    return _promotionRepository.getPromotions();
  }
}
