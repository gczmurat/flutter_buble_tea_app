import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/models/cart.dart';
import 'package:flutter_buble_tea_app/models/drink.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink){
    Provider.of<Cart>(context, listen: false).removeFromCart(drink);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
                child: Text(
              "Sepet 🛒",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                Drink drink = value.cart[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.brown.shade100,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(drink.name),
                      subtitle: Text("${drink.price} TL"),
                      leading: Image.asset(drink.image),
                      trailing: IconButton(onPressed: () => removeFromCart(drink), icon: Icon(Icons.delete,color: Colors.white,)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
