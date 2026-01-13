import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../components/cart_items.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        // Heading 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text('My Cart',style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold,
          ), ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: ListView.builder(
itemCount: value.getUserCart().length,
            itemBuilder: (context, index) {

          // get individual shoe
Shoe individualShoe = value.getUserCart()[index];

// return the cart item

return CartItems( shoe: individualShoe);

        }))
      ],
    ),);
  }
}
