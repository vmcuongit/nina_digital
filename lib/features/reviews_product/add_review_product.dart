import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddReviewProduct extends ConsumerWidget {
  const AddReviewProduct({super.key, required this.id});

  static const String nameRoute = 'add-reviews-product';
  static const String pathRoute = '/add-reviews-product/:id';
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Viết đánh giá'),
        centerTitle: false,
      ),
      body: Container(),
    );
  }
}
