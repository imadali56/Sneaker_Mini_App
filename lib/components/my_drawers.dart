import 'package:flutter/material.dart';
import 'package:updated_sneaker_app/components/my_listTile.dart';
import 'package:updated_sneaker_app/screens/cart_screen.dart';
import 'package:updated_sneaker_app/screens/intro_screen.dart';

class MyDrawers extends StatelessWidget {
  const MyDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // drawer head / Logo
          DrawerHeader(
            margin: EdgeInsets.zero,

            child: Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(height: 25),
          // shop Tile
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: MyListTile(
              text: 'Shop',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: MyListTile(
              text: 'Cart',
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => IntroScreen()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
