import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No Products yet __',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
    );
  }
}
