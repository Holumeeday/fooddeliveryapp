import 'package:asap/providers/favorite_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Favorites'),
          ],
        ),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final food = favorites[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(food['image']),
                  ),
                  title: Text(food['name']),
                  subtitle: Text('#${food['price']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref
                          .read(favoritesProvider.notifier)
                          .removeFromFavorites(food);
                    },
                  ),
                );
              },
            ),
    );
  }
}
