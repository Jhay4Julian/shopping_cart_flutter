import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF645CFF)),
        useMaterial3: true,
      ),
      home: const CartPage(),
    );
  }
}
