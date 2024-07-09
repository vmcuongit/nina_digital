import 'package:flutter/material.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  static const String nameRoute = 'product-category';
  static const String pathRoute = '/product-category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('product category'),
      ),
    );
  }
}
