import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositores/product_repository.dart';

final allProductProvider = FutureProvider.autoDispose((ref) {
  final ProductRepository productRepository = ProductRepository();
  return productRepository.fetchProducts();
});
