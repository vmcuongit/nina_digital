import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../repositores/product_repository.dart';

final allProductProvider = FutureProvider.autoDispose((ref) {
  final ProductRepository productRepository =
      ProductRepository(ref.watch(dioProvider));
  return productRepository.fetchProducts();
});
