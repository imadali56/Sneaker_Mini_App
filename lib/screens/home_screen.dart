import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/shop_screen.dart';
import '../components/bottom_navigation_bar.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  // selected index to control the bottom nav Bar
  int selectedIndex = 0;

  // method update selected index when user tap!
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
// screens to display
  final List<Widget> screens = [
    // shop screen
    const ShopScreen(),
    // cart screen
    const CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: screens[selectedIndex],
    );
  }
}
