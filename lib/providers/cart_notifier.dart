import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

 void addToCart({
    Map<String, dynamic>? food,
    Map<String, dynamic>? drink,
    required int quantity,
    required String selectedOption,
  }) {
    if (food == null && drink == null) {
      throw ArgumentError(
          "You must provide either a food or drink item to add to the cart.");
    }

    // Check if the item is already in the cart
    final existingItemIndex = state.indexWhere((cartItem) =>
        cartItem.food == food &&
        cartItem.drink == drink &&
        cartItem.selectedOption == selectedOption);

    if (existingItemIndex != -1) {
      // Update the quantity for the existing item
      final updatedItem = CartItem(
        food: food,
        drink: drink,
        quantity: state[existingItemIndex].quantity + quantity,
        selectedOption: selectedOption,
      );
      state = [
        ...state.sublist(0, existingItemIndex),
        updatedItem,
        ...state.sublist(existingItemIndex + 1),
      ];
    } else {
      // Add the new item
      final newItem = CartItem(
        food: food,
        drink: drink,
        quantity: quantity,
        selectedOption: selectedOption,
      );
      state = [...state, newItem];
    }
  }


  void removeFromCart(CartItem item) {
    state = state.where((cartItem) => cartItem != item).toList();
  }

  void clearCart() {
    state = [];
  }
  

  int get totalItems => state.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => state.fold(0.0, (sum, item) {
        final price =
            item.food?['miniPrice'] ?? item.drink?['smallPrice'] ?? 0.0;
        return sum + (price * item.quantity);
      });
}

 


class CartItem {
  final Map<String, dynamic>? food;
  final Map<String, dynamic>? drink;
  final int quantity;
  final String selectedOption;

  CartItem( {
     this.food,
     this.drink,
    required this.quantity,
    required this.selectedOption,
  });
}
