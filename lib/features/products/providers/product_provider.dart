import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/dio_client.dart';
import '../repositores/product_repository.dart';

class AllProductState {
  final bool isLoading;
  final List? products;
  final int currentPage;
  final bool isLastPage;

  AllProductState(
      {this.isLoading = true,
      this.products,
      this.currentPage = 1,
      this.isLastPage = false});

  copyWith(
      {bool? isLoading, List? products, int? currentPage, bool? isLastPage}) {
    return AllProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}

final allProductProvider =
    NotifierProvider.autoDispose<AllProductNotifier, AllProductState>(() {
  return AllProductNotifier();
});

class AllProductNotifier extends AutoDisposeNotifier<AllProductState> {
  late final ProductRepository _productRepository;
  bool isLastPage = false;

  @override
  AllProductState build() {
    _productRepository = ProductRepository(ref.watch(dioProvider));
    fetchProducts();
    return AllProductState();
  }

  Future<void> fetchProducts({int currentPage = 1, int limit = 10}) async {
    final response = await _productRepository.fetchProducts(
        currentPage: currentPage, limit: limit);
    List newProducts = [...?state.products];
    if (response != null) {
      newProducts = [...newProducts, ...response['data']];
      if (response['total_pages'] == currentPage) {
        isLastPage = true;
      }
    }
    state = state.copyWith(
        isLoading: false,
        products: newProducts,
        currentPage: currentPage,
        isLastPage: isLastPage);
  }
}

final productsPromotionProvider =
    NotifierProvider<ProductPromotionNotifier, Map>(() {
  return ProductPromotionNotifier();
});

class ProductPromotionNotifier extends Notifier<Map> {
  bool _refesh = false;

  @override
  Map build() {
    return {};
  }

  Future<void> refreshProductsPromotion() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        final list = _refesh
            ? [
                {
                  'id': 77,
                  'namevi': 'SS Galaxy S23 Ultra 5G (8GB/256GB)',
                  'price': '6666666'
                },
                {'id': 85, 'namevi': 'iPhone 14', 'price': '7777777'}
              ]
            : [
                {
                  'id': 77,
                  'namevi': 'SS Galaxy S23 Ultra 5G (8GB/256GB)',
                  'price': '4444444'
                },
                {'id': 85, 'namevi': 'iPhone 14', 'price': '5555555'}
              ];
        state = toMap(list);
      },
    );
    _refesh = !_refesh;
  }

  toMap(List<Map> data) {
    return {
      for (Map item in data) int.parse(item['id'].toString()): item['price']
    };
  }
}
