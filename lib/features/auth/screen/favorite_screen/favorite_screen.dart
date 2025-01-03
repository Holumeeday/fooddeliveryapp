import 'package:asap/providers/favorite_notifier.dart';
import 'package:asap/utils/constant.dart';
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
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final food = favorites[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(food['image']),
                      ),
                      title: Text(food['name'], style: TextStyle(color: Colors.white),),
                      subtitle: Text('#${food['price']}',  style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ref
                              .read(favoritesProvider.notifier)
                              .removeFromFavorites(food);
                        },
                      ),
                    ),
                  );
                },
              ),
          ),
    );
  }
}
