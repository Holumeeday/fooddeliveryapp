import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromotionWidget extends StatelessWidget {
  final List<String> images = [
    'https://healthyfitnessmeals.com/wp-content/uploads/2020/05/instagram-In-Stream_Square___One-pot-chicken-spaghetti-4.jpg',
    'https://i0.wp.com/www.cosiitaliano.com/wp-content/uploads/2014/11/Spaghetti-and-Meatballs-Enhsnced-680-x-453-@-8.jpg?fit=680%2C453&ssl=1',
    'https://www.slimmingeats.com/blog/wp-content/uploads/2013/02/spaghetti-meatballs-7-1-720x720.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CarouselSlider(
              items: images.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Free Delivery For\nSpaghetti',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Up to 3 times per day',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your button action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Order Now',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
