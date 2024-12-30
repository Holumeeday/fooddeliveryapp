import 'package:asap/providers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                final miniPrice =
                    item.food['miniPrice'] ?? 0.0; // Default to 0.0 if null
                final fullPrice =
                    item.food['fullPrice'] ?? 0.0; // Default to 0.0 if null
                final totalPrice = item.quantity *
                    (item.selectedOption == "Mini" ? miniPrice : fullPrice);
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item.food['image']),
                    ),
                    title: Text(item.food['name']),
                    subtitle: Text(
                      '${item.selectedOption} x ${item.quantity}\nTotal: #$totalPrice',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // cartNotifier.removeFromCart(item);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Proceed to checkout or perform other actions
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Proceeding to checkout...'),
                    ),
                  );
                },
                child: const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          : null,
    );
  }
}
