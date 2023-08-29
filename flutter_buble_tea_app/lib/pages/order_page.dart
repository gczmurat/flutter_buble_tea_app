import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/models/cart.dart';
import 'package:flutter_buble_tea_app/models/drink.dart';
import 'package:provider/provider.dart';

class orderPage extends StatefulWidget {
  Drink drink;
  orderPage({super.key, required this.drink});

  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  int quantityCount = 1;
  double sweatValue = 0.5;
  double iceValue = 0.5;
  double pearlValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweatValue = newValue;
    });
  }

  void customizeIce(double newValue2) {
    setState(() {
      iceValue = newValue2;
    });
  }

  void customizePearl(double newValue3) {
    setState(() {
      pearlValue = newValue3;
    });
  }

  void addToCart() {
    Provider.of<Cart>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown.shade300,
        title: Center(
            child: Text(
          "Sepete Eklendi",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.brown.shade300,
        elevation: 0,
        title: Text(widget.drink.name),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.brown.shade200,
      body: Column(
        children: [
          Image.asset(widget.drink.image),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(width: 80, child: Text("Şeker Oranı")),
                  ),
                  Expanded(
                    child: Slider(
                      divisions: 4,
                      label: sweatValue.toString(),
                      activeColor: Colors.brown.shade300,
                      value: sweatValue,
                      onChanged: (value) => customizeSweet(value),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(width: 80, child: Text("Buz Oranı")),
                  ),
                  Expanded(
                    child: Slider(
                      divisions: 4,
                      label: iceValue.toString(),
                      activeColor: Colors.brown.shade300,
                      value: iceValue,
                      onChanged: (value) => customizeIce(value),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(width: 80, child: Text("İnci Oranı")),
                  ),
                  Expanded(
                    child: Slider(
                      divisions: 4,
                      label: pearlValue.toString(),
                      activeColor: Colors.brown.shade300,
                      value: pearlValue,
                      onChanged: (value) => customizePearl(value),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.brown.shade500,
                ),
                onPressed: decrementQuantity,
              )),
              Text(
                quantityCount.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Container(
                  child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.brown.shade500,
                ),
                onPressed: incrementQuantity,
              )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            child: Text(
              "Sepete Ekle",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.brown.shade300,
            onPressed: addToCart,
          )
        ],
      ),
    );
  }
}
