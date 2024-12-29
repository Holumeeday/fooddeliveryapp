import 'package:asap/features/auth/screen/profile_screen/profile_details_widget.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:flutter/material.dart';

import '../order_screen/order_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Profile",
                style: bigText,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Personal details', style: mediumText),
                  Text(
                    'change',
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const ProfileDetails(),
              const SizedBox(
                height: 20,
              ),
              SubProfileMenu(
                text: 'Order',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SubProfileMenu(
                text: 'Pending reviews',
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SubProfileMenu(
                text: 'Faq',
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SubProfileMenu(
                text: 'Help',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              RoundedButton(text: 'Update', onpress: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class SubProfileMenu extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SubProfileMenu({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          height: 50,
          width: 320,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 26, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: mediumText,
                ),
                const Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
