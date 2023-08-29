import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/models/drink.dart';

class Cart extends ChangeNotifier{
  final List<Drink> _shop = [
    Drink(name: "Karamelli Buble Tea", price: "60", image: "images/buble1.png"),
    Drink(name: "Çukulatalı Buble Tea", price: "60", image: "images/buble2.png"),
    Drink(name: "Sütlü Buble Tea", price: "55", image: "images/buble4.png"),
    Drink(name: "Çilekli Buble Tea", price: "65", image: "images/buble3.png")
  ];

  final List<Drink> _userCart = [];
  List<Drink> get shop => _shop;
  List<Drink> get cart => _userCart;

  void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }

  void removeFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }

}
