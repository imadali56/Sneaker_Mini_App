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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // menu icon
        leading: Builder(
          builder: (context) {
            // menu icon
            return Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            // logo
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/nike_logo.png',
                    color: Colors.white,
                    width: 100,
                    height: 100,
                  ),
                ),

                SizedBox(height: 50),
                // Home screen navigation icon
                // home
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home', style: TextStyle(color: Colors.white)),
                  ),
                ),
                // about
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text('About', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 350),
            // logout
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
