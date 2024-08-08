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
