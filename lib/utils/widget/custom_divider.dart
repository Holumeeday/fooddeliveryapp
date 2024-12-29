import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150, 
      child: Divider(
        thickness: 1, 
        color: Colors.grey,
        height: 10, 
      ),
    );
  }
}
