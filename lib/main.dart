import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'features/auth/screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      // Initialize Firebase for Web
      await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAWAWR1COJuXjVz_zIZOaPeQu-mc0jXq3w",
            authDomain: "deliveryapp-59ffd.firebaseapp.com",
            projectId: "deliveryapp-59ffd",
            storageBucket: "deliveryapp-59ffd.firebasestorage.app",
            messagingSenderId: "92469349939",
            appId: "1:92469349939:web:24e927e14836d71ec0dd46"),
      );
    } else {
      // Initialize Firebase for Mobile
      await Firebase.initializeApp();
    }
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }
   runApp(
    const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
          useMaterial3: true,
        ),
        home: OnboardingScreen());
  }
}
