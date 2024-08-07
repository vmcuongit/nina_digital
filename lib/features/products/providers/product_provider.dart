import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../repositores/product_repository.dart';

// final allProductProvider = FutureProvider.autoDispose((ref) {
//   final ProductRepository productRepository =
//       ProductRepository(ref.watch(dioProvider));
//   return productRepository.fetchProducts();
// });

class AllProductState {
  final bool isLoading;
  final List? products;

  AllProductState({this.isLoading = true, this.products});

  copyWith({bool? isLoading, List? products}) {
    return AllProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}

final allProductProvider =
    NotifierProvider.autoDispose<AllProductNotifier, AllProductState>(() {
  return AllProductNotifier();
});

class AllProductNotifier extends AutoDisposeNotifier<AllProductState> {
  late final ProductRepository _productRepository;
  @override
  AllProductState build() {
    _productRepository = ProductRepository(ref.watch(dioProvider));
    init();
    return AllProductState();
  }

  Future<void> init() async {
    final response = await _productRepository.fetchProducts();
    state = state.copyWith(isLoading: false, products: response['data']);
  }
}

final productsPromotionProvider =
    NotifierProvider<ProductPromotionNotifier, Map>(() {
  return ProductPromotionNotifier();
});

class ProductPromotionNotifier extends Notifier<Map> {
  @override
  Map build() {
    return {};
  }

  Future<void> refreshProductsPromotion() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        final list = [
          {
            'id': 77,
            'namevi': 'SS Galaxy S23 Ultra 5G (8GB/256GB)',
            'price': '1000888'
          },
          {'id': 85, 'namevi': 'iPhone 14', 'price': '600888'}
        ];
        state = toMap(list);
      },
    );
  }

  toMap(List<Map> data) {
    return {
      for (Map item in data) int.parse(item['id'].toString()): item['price']
    };
  }
}
