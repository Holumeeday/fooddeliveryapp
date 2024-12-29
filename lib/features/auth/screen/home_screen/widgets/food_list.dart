import 'package:asap/features/auth/screen/home_screen/food_details_screen.dart';
import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  final List<Map<String, dynamic>> foods;
  const FoodList({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          
          return Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FoodDetailsScreen(food: food)));
                    },
                    child: Container(
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Food Image
                          Positioned(
                            top: -40,
                            left: 25,
                            right: 25,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              child: Image.asset(
                                food['image'],
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Food Name and Price
                          Positioned(
                            top: 80,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Text(
                                  food['name'],
                                  style: mediumText,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '#${food['price']}',
                                  style: priceStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
