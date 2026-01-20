import 'package:flutter/material.dart';
import 'package:updated_sneaker_app/components/my_button.dart';
import 'package:updated_sneaker_app/screens/shop_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Center(
            child: Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(height: 25),
          // title
          Text(
            'Kick Hub',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 5),
          // sub-title
          Text(
            'Premium Quality Products',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(height: 25),
          // button
          MyButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopScreen()),
              );
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
