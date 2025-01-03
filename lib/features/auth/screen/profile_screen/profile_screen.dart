import 'dart:io';

import 'package:asap/features/auth/controller/auth_controller.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/error_text.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/widget/loader.dart';
import '../settings/settings_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? image;
  TextEditingController _username = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 20);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      throw 'Failed to pick image';
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        image = File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    final userData = ref.watch(getUserDataProvider(userId));
    return Scaffold(
        backgroundColor: basicColor,
        body: userData.when(
            data: (data) {
              _username = TextEditingController(text: data.username);
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SettingsScreen()));
                              },
                              child: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            const Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Center(
                          child: image != null
                              ? CircleAvatar(
                                  radius: 80,
                                  backgroundImage: FileImage(
                                    image!,
                                  ),
                                )
                              : Center(
                                  child: data.profileImage != null
                                      ? Stack(
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        data.profileImage
                                                            .toString(),
                                                      ),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Positioned(
                                                bottom: 5,
                                                right: 0,
                                                child: Card(
                                                  elevation: 2,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.white),
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
                                            pickImage();
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
                                                      image:
                                                          const DecorationImage(
                                                              image: AssetImage(
                                                                "assets/icons/user.png",
                                                              ),
                                                              fit: BoxFit
                                                                  .cover))),
                                              Positioned(
                                                  bottom: 5,
                                                  right: 0,
                                                  child: Card(
                                                    elevation: 2,
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.white),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2,
                          child: TextFormField(
                            controller: _username,
                            enableSuggestions: true,
                            keyboardType: TextInputType.streetAddress,
                            onChanged: (value) {
                              _username.text = value;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 25),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: 'username',
                              hintStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.black, size: 20),
                              alignLabelWithHint: true,
                            ),
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return "Invalid username";
                              }
                              return null;
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      
                      RoundedButton(text: "Update Profile", onpress: (){
                        if (image != null) {
                              ref
                                  .watch(authControllerProvider.notifier)
                                  .updateUser(context, _username.text, image!);
                            } else {
                              // Handle the case where no image is selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please select an image before updating your profile.')),
                              );
                            }
                      })
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader()));
  }
}
