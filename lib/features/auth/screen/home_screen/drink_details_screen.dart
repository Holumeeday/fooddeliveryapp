import 'package:asap/providers/cart_notifier.dart';
import 'package:asap/providers/favorite_notifier.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/drink_option.dart';
import 'widgets/food_option.dart';

class DrinkDetailsScreen extends ConsumerWidget {
  final Map<String, dynamic> drink;
  const DrinkDetailsScreen({super.key, required this.drink});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = ref.read(favoritesProvider.notifier).isFavorite(drink);

     final double smallPrice = (drink['smallPrice'] ?? 0).toDouble();
    // double miniPrice = 0.0;
    // if (food['miniPrice'] is int) {
    //   miniPrice = (food['miniPrice'] as int).toDouble();
    // } else if (food['miniPrice'] is double) {
    //   miniPrice = food['miniPrice'] as double;
    // } else {
    //   miniPrice = 0.0;
    // }

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
            Flexible(child: Text(drink['name'])),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                final notifier = ref.read(favoritesProvider.notifier);
                if (isFavorite) {
                  notifier.removeFromFavorites(drink);
                } else {
                  notifier.addToFavorites(drink);
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
                  drink['image'],
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
                      drink['name'],
                      style: bigText2,
                    ),
                    Text(
                      '#${smallPrice.toStringAsFixed(2)}',
                      style: priceStyle,
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
                      '(400 ratings)',
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
                DrinkOptions(
                  smallPrice: (drink['smallPrice'] ?? 0.0).toDouble(),
                  bigPrice: drink['foodPrice'] ?? 0.0,
                  onOptionSelected: (String option, int quantity) {
                    cartNotifier.addToCart(
                        drink: drink, quantity: quantity, selectedOption: option);
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
            RoundedButton(
                text: ("Add to Cart"),
                onpress: () {
                  if ((drink['quantity'] ?? 0) > 0) {
                    cartNotifier.addToCart(
                      drink: drink,
                      quantity: 2,
                      selectedOption: 'Mini',
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart successfully!'),
                        ),
                      );
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
