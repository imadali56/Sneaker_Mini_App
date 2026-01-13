import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Jordan 4 Retro',
      price: '\$220',
      imagePath: 'assets/images/shoes_2.png',
      description:
          'Iconic heritage style meets premium craftsmanship for a legendary streetwear look',
    ),
    Shoe(
      name: 'NightRunner',
      price: '\$400',
      imagePath: 'assets/images/shoes_3.png',
      description: 'Sleek sneakers engineered for confidence after dark.',
    ),
    Shoe(
      name: 'CloudStep',
      price: '\$80',
      imagePath: 'assets/images/shoes_5.png',
      description: 'Ultra-soft cushioning for smooth, fatigue-free walking',
    ),
    Shoe(
      name: 'UrbanStride',
      price: '\$150',
      imagePath: 'assets/images/shoes_4.png',
      description: 'Where premium comfort meets city-ready performance',
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoesList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to the cart

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from the cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
