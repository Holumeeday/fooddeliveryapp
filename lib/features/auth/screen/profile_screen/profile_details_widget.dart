import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/custom_divider.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 320,
      decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20)),
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      'assets/profilepics.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ajayi Joshua",
                    style: mediumText,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Ajayijoshua@gmail.com",
                    style: mediumText2,
                  ),
                  CustomDivider(),
                  Text(
                    "+234 9013264733",
                    style: mediumText2,
                  ),
                  CustomDivider(),
                  Expanded(
                    child: Container(
                      width: 130,
                      child: Text(
                        "No 15 uti street off ovie palace road effurun delta state",
                        style: mediumText3,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
