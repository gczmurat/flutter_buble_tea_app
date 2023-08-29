import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/models/drink.dart';

class DrinkTile extends StatelessWidget {
  void Function()? onTap;
  Drink drink;
  DrinkTile({super.key, required this.drink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: Colors.brown.shade100,borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text("${drink.price} TL"),
          leading: Image.asset(drink.image),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        ),
      ),
    );
  }
}
