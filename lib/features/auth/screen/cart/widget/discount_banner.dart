import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: primaryColor,
      child: Marquee(
        text: '🎉 Get a discount of #250 on your total purchase! 🎉',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        scrollAxis: Axis.horizontal,
        blankSpace: 20.0,
        velocity: 50.0,
        pauseAfterRound: const Duration(seconds: 1),
      ),
    );
  }
}

