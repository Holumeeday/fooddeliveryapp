import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';

class DrinkList extends StatelessWidget {
  final List<Map<String, dynamic>> drinks;

  const DrinkList({super.key, required this.drinks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              children: [
                Center(
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
                              drink['image'],
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
                                drink['name'],
                                style: mediumText,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '#${drink['price']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
