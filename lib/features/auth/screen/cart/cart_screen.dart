import 'package:asap/features/auth/screen/cart/widget/discount_banner.dart';
import 'package:asap/providers/cart_notifier.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquee/marquee.dart';

import 'widget/cart_item_card.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider); // Watch cart items
    final cartNotifier = ref.read(cartProvider.notifier);
    final totalItems =
        cartItems.fold<int>(0, (sum, item) => sum + item.quantity);
    final subtotal = cartNotifier.totalPrice; 
    const int tax = 500; 
    const int discount = 250;
    final totalPrice = subtotal + tax - discount; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? Column(
              children: [
                Image.asset(
                  'assets/icons/empty_cart.gif',
                  width: 200,
                  height: 250,
                  // fit: BoxFit.cover,
                ),
                const Center(
                  child: Text(
                    'Your cart is empty!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 
                DiscountBanner(),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      final image = item.food?['image'] ?? item.drink?['image'];
                      final name = item.food?['name'] ?? item.drink?['name'];
                      final price = item.food?['miniPrice'] ??
                          item.drink?['smallPrice'] ??
                          0.0;

                      return CartItemCard(
                          item: item,
                          hashCode: hashCode,
                          cartNotifier: cartNotifier,
                          name: name,
                          image: image,
                          price: price);
                    },
                  ),
                ),
                // Checkout Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Total Price
                      Text(
                        'Subtotal: #${cartNotifier.totalPrice.toStringAsFixed(2)}',
                        style: mediumText,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Quantity: $totalItems',
                        style: mediumText,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Tax: $tax',
                        style: mediumText,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Total: $totalPrice',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      // Checkout Button
                      RoundedButton(
                      text: "Checkout", 
                      onpress: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Proceeding to checkout...'),
                              ),
                            );
                      }),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

