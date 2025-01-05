import 'package:asap/utils/widget/error_text.dart';
import 'package:asap/utils/widget/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/promotion_controller.dart';


class PromotionsWidegt extends ConsumerWidget {
  const PromotionsWidegt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promotions = ref.watch(getPromotions);
    return promotions.when(
        data: (data) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CarouselSlider(
                items: data.images!.map((i) {
                  return Builder(builder: (BuildContext context) {
                    return CachedNetworkImage(
                      imageUrl: i,
                      height: 166,
                      width:double.infinity,
                      fit: BoxFit.cover,
                    );
                  });
                }).toList(),
                options: CarouselOptions(height: 200, autoPlay: true,viewportFraction: 1)),
          );
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
