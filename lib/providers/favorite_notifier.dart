// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final favoritesProvider =
//     StateNotifierProvider<FavoritesNotifier, List<Map<String, dynamic>>>(
//   (ref) => FavoritesNotifier(),
// );

// class FavoritesNotifier extends StateNotifier<List<Map<String, dynamic>>> {
//   FavoritesNotifier() : super([]);

//   void addToFavorite(Map<String, dynamic> food) {
//     if (!state.any((item) => item['name'] == food['name'])) {
//       state = [...state, food];
//     }
//   }

//   void removeFromFavorite(Map<String, dynamic> food) {
//     state = state.where((item) => item['name'] != food['name']).toList();
//   }

//   bool isFavorite(Map<String, dynamic> food) {
//     return state.any((item) => item['name'] == food['name']);
//   }
// }



import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the provider for the list of favorites
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Map<String, dynamic>>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  FavoritesNotifier() : super([]);

  // Add an item to favorites
  void addToFavorites(Map<String, dynamic> food) {
    if (!state.any((item) => item['name'] == food['name'])) {
      state = [...state, food];
    }
  }

  // Remove an item from favorites
  void removeFromFavorites(Map<String, dynamic> food) {
    state = state.where((item) => item['name'] != food['name']).toList();
  }

  // Check if an item is a favorite
  bool isFavorite(Map<String, dynamic> food) {
    return state.any((item) => item['name'] == food['name']);
  }
}
