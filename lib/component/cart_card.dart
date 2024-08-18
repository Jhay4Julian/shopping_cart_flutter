import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String unit;
  final VoidCallback onRemove;
  final VoidCallback onAdd;
  final VoidCallback onMinus;
  const CartCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
    required this.onRemove,
    required this.onAdd,
    required this.onMinus,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Product Image
                    Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Product Name, Price & Remove button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Product Name
                          Text(
                            widget.name,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              letterSpacing: 1,
                            ),
                          ),
                          // Product Price
                          Text(
                            '\$${widget.price}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          // Remove Item Button
                          InkWell(
                            onTap: widget.onRemove,
                            child: const Text(
                              'remove',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.indigoAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Unit count Increase & Decrease buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Increase Unit
                  InkWell(
                    onTap: widget.onAdd,
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.indigo,
                      size: 28,
                    ),
                  ),
                  // Unit
                  Text(
                    widget.unit,
                    style: const TextStyle(fontSize: 18),
                  ),
                  // Decrease Unit
                  InkWell(
                    onTap: widget.onMinus,
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.indigo,
                      size: 28,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
