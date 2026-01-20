import 'package:flutter/cupertino.dart';
import 'package:updated_sneaker_app/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale

  final List<Product> _shop = [
    // product 1
    Product(
      name: 'Rado Original',
      price: 99.99,
      description:
          'Elegant, durable, and iconic — the true essence of Rado',
      imagePath: 'assets/images/watch.png'
    ),
    // product 2
    Product(
      name: 'Lenovo',
      price: 399,
      description: 'Smooth multitasking with long battery life and modern connectivity',
      imagePath: 'assets/images/laptop.png'
    ),

    // product 3
    Product(
      name: 'Urban Walk',
      price: 60,
      description: 'Comfortable shoes made for daily use',
      imagePath: 'assets/images/shoes.png'
    ),

    // product 4
    Product(
      name: 'Hoodie',
      price: 120,
      description: 'Stylish comfort for all-day wear with a durable, lightweight design',
      imagePath: 'assets/images/hoodie.png'
    ),

    // product 5
    Product(
      name: 'Black Men Glasses',
      price: 22,
      description: 'Bold black frames for timeless style and everyday confidence',
      imagePath: 'assets/images/glasses.png'
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  //  get user cart
  List<Product> get cart => _cart;

  // add items to cart
  void addToCart(Product item) {
    cart.add(item);
    notifyListeners();
  }

  // remove items from the cart
  void removeFromCart(Product item) {
    cart.remove(item);
    notifyListeners();
  }
}
