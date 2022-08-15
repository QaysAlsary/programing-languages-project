import 'package:flutter/material.dart';

import 'products.dart';

class ItemCard extends StatelessWidget {
  final Products products;
  final Function press;

  const ItemCard({
    Key? key,
    required this.products,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => press(),
          child: Container(
            padding: EdgeInsets.all(20),
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(16)),
            child: Image.network(products.image!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            products.title!,
            style: TextStyle(color: Colors.black),
          ),
        ),
        // Text("\$${products.price}",style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }
}
