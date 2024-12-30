import 'package:asap/features/auth/screen/cart/cart_screen.dart';
import 'package:asap/features/auth/screen/home_screen/widgets/drink_list.dart';
import 'package:asap/features/auth/screen/home_screen/widgets/food_list.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/search_input.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white70,
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CartScreen()));
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delicious\nfood for you',
                  style: bigText,
                ),
                const SizedBox(height: 20),
                // Search Bar
                const Search_Input(),

                const SizedBox(height: 25),

                PreferredSize(
                  preferredSize: const Size.fromHeight(50),
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
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text(
                      'see more',
                      style: TextStyle(color: primaryColor),
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
              ],
            ),
          ),
        ));
  }
}

// Widget _foodList() {
//   return ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: 5,
//    itemBuilder: (context, index) {

//     return Padding(
//           padding: const EdgeInsets.only(right: 15, left: 15),
//           child: Row(
//             children: [
//               Center(
//                 child: Container(
//                   width: 150,
//                   height: 180,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 8,
//                         spreadRadius: 2,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       // Food Image
//                       Positioned(
//                         top: -40,
//                         left: 25,
//                         right: 25,
//                         child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.vertical(top: Radius.circular(20)),
//                           child: Image.asset(
//                             'assets/food1.png',
//                             height: 120,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       // Food Name and Price
//                       const Positioned(
//                         top: 80,
//                         left: 0,
//                         right: 0,
//                         child: Column(
//                           children: [
//                             Text(
//                               "Veggie\ntomato mix",
//                               style: mediumText,
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               "₦1,900",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: primaryColor,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//   });

// }

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
