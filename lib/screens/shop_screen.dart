import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updated_sneaker_app/components/my_drawers.dart';
import 'package:updated_sneaker_app/components/product_tile.dart';
import 'package:updated_sneaker_app/models/shop.dart';
import 'package:updated_sneaker_app/screens/cart_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // access product in the shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Shop Page', style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,

        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
          }, icon: Icon(Icons.shopping_bag))
        ],
      ),
      drawer: MyDrawers(),
      body: ListView(
        children: [
          // title
          SizedBox(height: 10),
          // sub- title
          Center(
            child: Text(
              'Pick from the selected list of premium Products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];
                // return as a product tile ui
                return MyProductTile(products: product);
              },
            ),
          ),
        ],

      ),
    );
  }
}
