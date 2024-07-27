import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/product_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  static const String nameRoute = 'products';
  static const String pathRoute = '/products';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue asyncValue = ref.watch(allProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test API'),
      ),
      body: asyncValue.when(
        data: (data) {
          print(data['data']['total']);
          return Center(child: Text(data['data']['total']));
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
