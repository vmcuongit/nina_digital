import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import '../../shared/constants/api_url.dart';
import '../../shared/constants/media_assets.dart';
import '../../shared/utils/helper.dart';
import '../product_detail/product_detail_screen.dart';
import 'providers/product_provider.dart';

part 'widgets/item_product_widget.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  static const String nameRoute = 'products';
  static const String pathRoute = '/products';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm'),
        centerTitle: false,
      ),
      body: const _DanhSachSanPham(),
    );
  }
}

class _DanhSachSanPham extends ConsumerStatefulWidget {
  const _DanhSachSanPham({super.key});

  @override
  ConsumerState createState() => __DanhSachSanPhamState();
}

class __DanhSachSanPhamState extends ConsumerState<_DanhSachSanPham> {
  late final ScrollController _scrollController;
  bool isLastPage = false;
  int currentPage = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      if (!isLastPage) {
        currentPage = currentPage + 1;
        ref
            .read(allProductProvider.notifier)
            .fetchProducts(currentPage: currentPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(allProductProvider);
    isLastPage = result.isLastPage;
    currentPage = result.currentPage;
    return (result.isLoading == false)
        ? (!Helper.isNull(result.products))
            ? SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    AlignedGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: result.products?.length,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        final item = result.products?[index] ?? {};
                        return _ItemProductWidget(
                          product: item,
                        );
                      },
                    ),
                    if (!isLastPage) ...[
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 18,
                                child: CircularProgressIndicator.adaptive()),
                            SizedBox(
                              width: 10,
                            ),
                            Text('đang tài dữ liệu...')
                          ],
                        ),
                      )
                    ],
                  ],
                ),
              )
            : const SizedBox.shrink()
        : const Center(
            child: CircularProgressIndicator.adaptive(),
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
