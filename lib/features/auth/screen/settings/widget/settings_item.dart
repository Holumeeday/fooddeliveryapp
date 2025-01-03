import 'package:asap/utils/constant.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsItemWidget extends StatelessWidget {
  String title;
  String leadIcon;

  SettingsItemWidget({super.key, required this.title, required this.leadIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(leadIcon),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Image.asset(
                "assets/icons/arrowright.png",
                height: 20,
                width: 20,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DottedLine(
              dashColor: primaryColor,
              direction: Axis.horizontal,
              lineThickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
