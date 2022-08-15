import 'package:flutter/material.dart';

import 'details_screen_body.dart';
import 'products.dart';

class DetailsScreen extends StatelessWidget {
  final Products products;

  const DetailsScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_sharp)),
      ),
      body: DetailsScreenBody(products: products),
    );
  }
}
