import 'package:asap/features/auth/screen/main_screen.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        backgroundColor: const Color.fromARGB(226, 245, 245, 245),
        body: Column(
          children: [
            
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.asset(
                      'assets/logo1.png',
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 50),
                  PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.transparent,
                            width: 0, // Removes the bottom line
                          ),
                        ),
                      ),
                      child: const TabBar(
                        indicatorColor: primaryColor,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(text: "Login"),
                          Tab(text: "Sign-up"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // TabBarView Section
            Expanded(
              child: TabBarView(
                children: [
                  // Login Tab
                  _buildLoginForm(context),
                  // Sign-up Tab
                  const Center(child: Text("Sign-up Page Placeholder")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Login Form
Widget _buildLoginForm(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5,),
          const Text(
            "Email address",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 1),
          const TextField(
            decoration: InputDecoration(
              hintText: "example@gmail.com",
              border: UnderlineInputBorder(),
            ),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "Password",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "●●●●●●●●",
              border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Handle Forgot Password
              },
              child: const Text(
                "Forgot passcode?",
                style: TextStyle(color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 24),
          RoundedButton(
            text: "Login",
            onpress: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
          ),
        ],
      ),
    ),
  );
}
