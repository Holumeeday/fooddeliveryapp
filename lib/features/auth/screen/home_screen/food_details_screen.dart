import 'package:asap/providers/cart_notifier.dart';
import 'package:asap/providers/favorite_notifier.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/food_option.dart';

class FoodDetailsScreen extends ConsumerWidget {
  final Map<String, dynamic> food;
  const FoodDetailsScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = ref.read(favoritesProvider.notifier).isFavorite(food);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(food['name']),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                final notifier = ref.read(favoritesProvider.notifier);
                if (isFavorite) {
                  notifier.removeFromFavorites(food);
                } else {
                  notifier.addToFavorites(food);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  food['image'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      food['name'],
                      style: bigText2,
                    ),
                    Text(
                      '#${food['price'] ?? 0.0}',
                      style: detailsPrice,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFD700)),
                    Text(
                      '4.7',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '(342 ratings)',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodOptions(
                                  miniPrice: food['miniPrice'] ?? 0.0,
                                  fullPrice: food['foodPrice'] ?? 0.0,
                                  onOptionSelected: (String option, int quantity) {
                cartNotifier.addToCart(
                    food: food, quantity: quantity, selectedOption: option);
                                  },
                                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Description',
                  style: bigText2,
                ),
                const Text(
                  'A vibrant medley of fresh, locally sourced vegetables sautéed to perfection. This healthy and flavorful dish features a mix of crunchy bell peppers, tender zucchini, and crisp broccoli, all tossed in a light garlic and herb dressing.',
                  style: mediumText2,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            RoundedButton(text: ("Add to Cart"), onpress: () {
               cartNotifier.addToCart(
                    food: food,
                    quantity: 2, 
                    selectedOption: 'Mini', 
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart successfully!'),
                    ),
                  );
            })
          ],
        ),
      ),
    );
  }
}
