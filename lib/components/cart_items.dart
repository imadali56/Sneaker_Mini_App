import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Added this
import '../models/cart.dart';          // Added this
import '../models/shoe.dart';

class CartItems extends StatefulWidget {
  Shoe shoe;
  CartItems({super.key, required this.shoe});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {

  // Method to call the remove logic from model
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.shoe.name),
      leading: Image.asset(widget.shoe.imagePath),
      subtitle: Text(widget.shoe.price),
      // Added the delete button here
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: removeItemFromCart,
      ),
    );
  }
}