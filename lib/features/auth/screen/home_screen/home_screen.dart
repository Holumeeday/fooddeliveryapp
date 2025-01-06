import 'package:asap/features/auth/screen/cart/cart_screen.dart';
import 'package:asap/features/auth/screen/home_screen/widgets/drink_list.dart';
import 'package:asap/features/auth/screen/home_screen/widgets/food_list.dart';
import 'package:asap/features/auth/screen/promotion/widgets/promotion_widget.dart';
import 'package:asap/providers/cart_notifier.dart';
import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer(
                builder: (context, ref, child) {
                  final cartItems = ref.watch(cartProvider);
                  final totalItems = cartItems.fold<int>(
                      0, (sum, item) => sum + item.quantity);

                  return Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.grey,
                        ),
                      ),
                      if (totalItems > 0)
                        Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '$totalItems',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height: 200, 
                  child: PromotionWidget(),
                ),
                
            
                const SizedBox(height: 15),

                PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Material(
                    color: Colors.white,
                    elevation: 0,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Image.asset('assets/foodicon.png'),
                          ),
                        Tab(
                          child: Image.asset('assets/drinkicon.png'),
                          ),
                        Tab(
                          child: Image.asset('assets/foodicon.png'),
                        ),
                        Tab(
                          child: Image.asset('assets/snacksicon.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hot Deals', style: mediumText,),
                    Text(
                      'see more',
                      style: mediumText,
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                Container(
                  height: 280,
                  color: Colors.white,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      const FoodList(
                        foods: [
                          {
                            'name': 'Jollof Rice with Chicken ',
                            'price': 1500,
                            'image': 'assets/food1.jpeg',
                            'miniPrice': 1500,
                          },
                          {
                            'name': 'J-Pasta ',
                            'price': 1800,
                            'image': 'assets/food2.jpeg',
                            'miniPrice': 1800,
                          },
                          {
                            'name': 'Italian Toast',
                            'price': 1700,
                            'image': 'assets/food3.jpeg',
                            'miniPrice': 1700,
                          },
                          {
                            'name': 'Fried Rice with Chicken',
                            'price': 1400,
                            'image': 'assets/food4.jpeg',
                            'miniPrice': 1400,
                          },
                          {
                            'name': 'Ghana Jollof with Chicken',
                            'price': 1200,
                            'image': 'assets/food5.jpeg',
                            'miniPrice': 1200,
                          },
                          {
                            'name': 'Alc',
                            'price': 1200,
                            'image': 'assets/food1.png',
                            'miniPrice': 1200,
                          },
                        ],
                      ), // Foods
                      const DrinkList(
                        drinks: [
                          {
                            'name': 'Soda Drink',
                            'price': 1300,
                            'image': 'assets/drink1.jpg'
                          },
                          {
                            'name': 'Mango Smoothie',
                            'price': 1500,
                            'image': 'assets/drink2.jpeg'
                          },
                          {
                            'name': 'Berry Shake',
                            'price': 1700,
                            'image': 'assets/drink3.jpg'
                          },
                          {
                            'name': 'Chocolate Shake',
                            'price': 1400,
                            'image': 'assets/drink4.jpg'
                          },
                          {
                            'name': 'Alc',
                            'price': 1200,
                            'image': 'assets/drink5.jpg'
                          },
                        ],
                      ), // Drinks
                      _SnackList(), // Snacks
                      _SauceList(), // Sauces
                    ],
                  ),
                ),

                //  const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recomended for you',
                      style: mediumText,
                    ),
                    Text(
                      'see more',
                      style: mediumText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _SnackList() {
  return ListView(
    children: const [Card()],
  );
}

Widget _SauceList() {
  return ListView(
    children: const [Card()],
  );
}
