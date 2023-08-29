import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/components/bottom_nav_bar.dart';
import 'package:flutter_buble_tea_app/pages/cart_page.dart';
import 'package:flutter_buble_tea_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex){
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      bottomNavigationBar: BottomNavBar(onTabChange: (index) =>  navigateBottomBar(index),),
      body: _pages[_selectedIndex],
    );
  }
}