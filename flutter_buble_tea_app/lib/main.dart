import 'package:flutter/material.dart';
import 'package:flutter_buble_tea_app/models/cart.dart';
import 'package:flutter_buble_tea_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
    builder: (context, child) => MaterialApp(
      title: 'Buble Tea',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    ),);
  }
}