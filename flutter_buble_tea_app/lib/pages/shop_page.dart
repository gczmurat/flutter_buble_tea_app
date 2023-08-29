import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/components/drink_tile.dart';
import 'package:flutter_buble_tea_app/models/cart.dart';
import 'package:flutter_buble_tea_app/models/drink.dart';
import 'package:flutter_buble_tea_app/pages/order_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink){
    Navigator.push(context, MaterialPageRoute(builder: (context) => orderPage(drink: drink,),));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Buble Tea Mağazası 🥤",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10,),
              Expanded(
                  child: ListView.builder(
                itemCount: value.shop.length,
                itemBuilder: (context, index) {
                  Drink idividualDrink = value.shop[index];
                  return DrinkTile(drink: idividualDrink, onTap: () => goToOrderPage(idividualDrink),);
                }
              ))
            ],
          ),
        ),
      ),
    );
  }
}
