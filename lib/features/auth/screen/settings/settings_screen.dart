import 'package:asap/features/auth/screen/auth_screen.dart';
import 'package:asap/features/auth/screen/main_screen.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/widget/error_text.dart';
import '../../../../utils/widget/loader.dart';
import '../../controller/auth_controller.dart';
import '../profile_screen/profile_screen.dart';
import 'widget/settings_item.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    final userData = ref.watch(getUserDataProvider(userId));
    return Scaffold(
        backgroundColor: primaryColor, 
        body: userData.when(
            data: (data) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          },
                          child: const Icon(Icons.arrow_back),
                         
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        },
                        child: Center(
                          child: data.profileImage != null
                              ? Stack(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                data.profileImage.toString(),
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                        bottom: 5,
                                        right: 0,
                                        child: Card(
                                          elevation: 2,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: Image.asset(
                                              "assets/icons/cameraicon.png",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                        ))
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfileScreen()));
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: primaryColor,
                                                  width: 2),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                    "assets/icons/user.png",
                                                  ),
                                                  fit: BoxFit.cover))),
                                      Positioned(
                                          bottom: 5,
                                          right: 0,
                                          child: Card(
                                            elevation: 2,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Image.asset(
                                                "assets/icons/cameraicon.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: data.username != null
                            ? Text(
                                data.username.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            : const SizedBox(),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileScreen()));
                                },
                                child: SettingsItemWidget(
                                    title: "Account Information",
                                    leadIcon: "assets/icons/profile.png"),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => AddressPage()));
                                },
                                child: SettingsItemWidget(
                                    title: "Address Information",
                                    leadIcon: "assets/icons/location.png"),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const OrdersScreen()));
                                },
                                child: SettingsItemWidget(
                                    title: "My Orders",
                                    leadIcon: "assets/icons/trackorder.png"),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SettingsItemWidget(
                                  title: "Notifications",
                                  leadIcon:
                                      "assets/icons/notificationfilled.png"),
                              const SizedBox(
                                height: 40,
                              ),
                              
                              RoundedButton(text: "LogOut", onpress: (){
                                 ref
                                        .read(
                                            authControllerProvider.notifier)
                                        .signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                              const  AuthScreen()));
                              })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader()));
  }
}
