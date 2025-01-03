import 'package:asap/features/auth/controller/auth_controller.dart';
import 'package:asap/features/auth/model/user_model.dart';
import 'package:asap/router.dart';
import 'package:asap/utils/widget/error_text.dart';
import 'package:asap/utils/widget/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:routemaster/routemaster.dart';

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
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel); 
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
      data: 
      (data)=> MaterialApp.router(
        // color: AppColor.primaryColor
        debugShowCheckedModeBanner: false,
        routerDelegate: RoutemasterDelegate(routesBuilder: (context){ 
          if(data!= null){
            getData(ref, data);
            return loggedInRoute;
          }
          return loggedOutRoute;
        }),
        routeInformationParser: const RoutemasterParser(),

      ), 
      error: (error, _)=> ErrorText(error: error.toString()), 
      loading: ()=> const Loader());
  }
}
