import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const String nameRoute = 'products';
  static const String pathRoute = '/products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('products'),
      ),
    );
  }
}
