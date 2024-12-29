import 'package:asap/features/auth/screen/main_screen.dart';
import 'package:asap/utils/constant.dart';
import 'package:asap/utils/widget/rounded_button.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
            title: Center(child: Text("Order", style: mediumText,)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(''),
              )
            ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cart.png',
              width: 100,
              height: 100,
              
            ),

          const  Text('No orders yet', style: bigText2,),

          const SizedBox(
            width: 200,
            child: Text('Hit the orange button down below to Create an order', textAlign: TextAlign.center,),
          ),

          const SizedBox(height: 200,),
          RoundedButton(text: 'Start Ordering', onpress: (){
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
          })
          ],
        ),
      ),
    );
  }
}