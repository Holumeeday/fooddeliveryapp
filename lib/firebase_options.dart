import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConstants {
  static const int fetchingLimit = 10;
  static const usersCollection = "users";
  static const categories = "categories";
  static const menu = "menu";
  static const promotions = "promotions";
  static const ingredients = "ingredients";
  static const address = "address";
  static const orderCollection = "orders";
  static final user = FirebaseAuth.instance.currentUser!;
  static final cartRef =
      FirebaseFirestore.instance.collection("users").doc(user.uid.toString());
  static final orderRef =
      FirebaseFirestore.instance.collection("users").doc(user.uid.toString());
  static final addressRef =
      FirebaseFirestore.instance.collection("addresses").doc(user.uid);
}
