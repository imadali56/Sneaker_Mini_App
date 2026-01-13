import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: Colors.grey[300]),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/nike_logo.png', height: 100),
          ),
          SizedBox(height: 150),
          // Title
          Text(
            'Just Do It',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          // Sub-Title
          Text(
            'Exclusive new sneakers and custom kicks made with top-tier premium quality',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(height: 20),
          // Shop Now Button
          Padding(
            padding: const EdgeInsets.all(25.0),
            // container
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                // shop now text
                child: Center(
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
