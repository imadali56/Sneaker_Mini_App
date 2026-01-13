import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../components/shoe_tile.dart';


class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search', style: TextStyle(
                  color: Colors.grey
              ),),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ), // search bar
        // Message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'Everyone starts in sneakers.. Never stop', style: TextStyle(
              color: Colors.grey[600]
          ),),
        ),
        // hot picks and see all
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // // hot Picks
              Text('Hot Picks 🔥', style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold
              ),),
              // see all
              Text('See all', style: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(child: ListView.builder(
          itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // create a show
              Shoe shoe = Shoe(name: 'Air Flex',
                  price: '\$34',
                  imagePath: 'assets/images/shoes_4.png',
                  description: 'Flexible design, all-day comfort');
              return ShoeTile(
                shoe: shoe,
              );
            }

        )),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(
            color: Colors.white,

          ),
        )
      ],
    );
  }
}
