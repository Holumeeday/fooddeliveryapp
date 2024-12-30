import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart({
    required Map<String, dynamic> food,
    required int quantity,
    required String selectedOption,
  }) {
    final item = CartItem(
      food: food,
      quantity: quantity,
      selectedOption: selectedOption,
    );
    state = [...state, item];
  }
}

 


class CartItem {
  final Map<String, dynamic> food;
  final int quantity;
  final String selectedOption;

  CartItem({
    required this.food,
    required this.quantity,
    required this.selectedOption,
  });
}
