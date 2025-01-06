
import 'package:asap/providers/pages_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'favorite_screen/favorite_screen.dart';
import 'home_screen/home_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'settings/settings_screen.dart';


class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final currentIndex = ref.watch(pageProvider);

    final List<Widget> pages = [
      const HomeScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
      const SettingsScreen() 
    ];

    return Scaffold(

     
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(pageProvider.notifier).setPage(index);
        },
        selectedItemColor: Colors.black, 
        unselectedItemColor: Colors.grey, 
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline,
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
            ),
           label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: ''
          ), 
        ],
      ),
    );
  }
}
