import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/component/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartList = [
    {
      "name": "Lenovo IdeaPad 1",
      "image": "assets/images/lenovo.jpg",
      "price": 329.99,
      "unit": 1,
    },
    {
      "name": "Acer Aspire Go 15",
      "image": "assets/images/acer.jpg",
      "price": 299.99,
      "unit": 1,
    },
    {
      "name": "ASUS Vivobook Go",
      "image": "assets/images/asus.jpg",
      "price": 229.99,
      "unit": 1,
    },
    {
      "name": "Apple M2 MackBook",
      "image": "assets/images/apple.jpg",
      "price": 1598.99,
      "unit": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Text(
              'YOUR BAG',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 35),
            cartList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(50),
                    child: Center(
                      child: Text(
                        'Your bag is empty.',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                : Column(
                    children: cartList.map((cartItem) {
                      final String? name = cartItem['name'];
                      final String? image = cartItem['image'];
                      final double? price = cartItem['price'];
                      int unit = cartItem['unit'];

                      // Remove Cart Item
                      void removeItem() {
                        setState(() {
                          cartList.remove(cartItem);
                        });
                      }

                      // Increase Cart Item
                      void increment() {
                        setState(() {
                          unit++;
                          cartItem['unit'] = unit;
                        });
                      }

                      // Decrease Cart Item
                      void decrement() {
                        setState(() {
                          unit--;
                          cartItem['unit'] = unit;
                        });
                      }

                      return CartCard(
                        name: '$name',
                        image: '$image',
                        price: '$price',
                        unit: '$unit',
                        onRemove: removeItem,
                        onAdd: increment,
                        onMinus: decrement,
                      );
                    }).toList(),
                  )
          ],
        ),
      ),
    );
  }
}
