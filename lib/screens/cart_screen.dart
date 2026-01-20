import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updated_sneaker_app/components/my_button.dart';
import 'package:updated_sneaker_app/models/product.dart';
import 'package:updated_sneaker_app/models/shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // remove item from cart method

  void removeItemFromCart(BuildContext context, Product products) {
    // show a dialogue box to remove item from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the number for more/less roundness
        ),
        content: Text('want to Remove Product from Cart?'),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);
              // add to cart item
              context.read<Shop>().removeFromCart(products);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }
// user pressed the pay button
  void payButtonPressed(BuildContext context){
showDialog(context: context, builder: (context) => AlertDialog(
content: Text('User wants to pay, connect with backened!!', textAlign: TextAlign.center, style: TextStyle(
  fontSize: 17
),),

actions: [
  // cancel button
  MaterialButton(
    onPressed: () => Navigator.pop(context),
    child: Center(child: Text('OK')),
  ),
],
),

);

  }
  @override
  Widget build(BuildContext context) {
    // get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty ? Center(child: Text('Cart is Empty')):ListView.builder(
              itemCount: cart.length,

              itemBuilder: (context, index) {
                // get individual item in cart
                final item = cart[index];
                // return as a cart tile ui
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  padding: EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    leading: Image.asset(item.imagePath),
                    title: Text(item.name),
                    subtitle: Text("\$${item.price.toStringAsFixed(0)}"),
                    trailing: IconButton(
                      onPressed: () => removeItemFromCart(context, item),
                      icon: Icon(Icons.remove, color: Colors.red[400]),
                    ),
                  ),
                );
              },
            ),
          ),
          // pay button
          // MyButton(
          //     onTap: () =>  payButtonPressed(context),
          //     child: Text('Pay Now'))

          GestureDetector(
            onTap: () => payButtonPressed(context),

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
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
