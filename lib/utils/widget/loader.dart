import 'package:asap/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}