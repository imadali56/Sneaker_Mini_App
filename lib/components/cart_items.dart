import 'package:flutter/material.dart';

import '../models/shoe.dart';
class CartItems extends StatefulWidget {
  Shoe shoe;
   CartItems({super.key, required this.shoe});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.shoe.name),
      leading: Image.asset(widget.shoe.imagePath),
      subtitle: Text(widget.shoe.price),
    );
  }
}
