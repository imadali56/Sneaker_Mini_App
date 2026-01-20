import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updated_sneaker_app/models/product.dart';
import 'package:updated_sneaker_app/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product products;

  const MyProductTile({super.key, required this.products});

  // add to cart button pressed

  void addToCart(BuildContext context){
    // show a dialogue box to confirm add to cart
    showDialog(context: context, builder: (context)=> AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      
      content: Text('Want to add this Product to Cart?'),
      actions: [
        // cancel button
MaterialButton(onPressed: () => Navigator.pop(context),child: Text('Cancel'),),

        // yes button
      MaterialButton(
          onPressed:(){
            // pop dialog box
            Navigator.pop(context);
            // add to cart item
            context.read<Shop>().addToCart(products);

          },
          child: Text('Yes')
      )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product image
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,

                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child:Image.asset(products.imagePath),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // product name
                  Row(
                    children: [
                      Text(
                        products.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  // product price
                  Container(
                    width: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '\$${products.price.toStringAsFixed(0)}',

                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              // product description
              Text(
                products.description,

                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          SizedBox(height: 25),
          // product price + add to cart button
          // add button
          GestureDetector(
            onTap: () => addToCart(context),

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
