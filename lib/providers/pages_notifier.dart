import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagesNotifier extends StateNotifier<int> {
  PagesNotifier() : super(0);

  void setPage(int index) {
    state = index;
  }
}

final pageProvider = StateNotifierProvider<PagesNotifier, int>((ref) {
  return PagesNotifier();
});
