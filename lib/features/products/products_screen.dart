import 'dart:async';

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

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  static const String nameRoute = 'products';
  static const String pathRoute = '/products';

  @override
  ConsumerState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        ref.read(productsPromotionProvider.notifier).refreshProductsPromotion();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(allProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm'),
        centerTitle: false,
      ),
      body: (result.isLoading == false)
          ? _DanhSachSanPham(
              products: result.products,
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class _DanhSachSanPham extends ConsumerWidget {
  const _DanhSachSanPham({super.key, this.products});

  final List? products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsPromotion = ref.watch(productsPromotionProvider);
    return (!Helper.isNull(products))
        ? AlignedGridView.count(
            padding: const EdgeInsets.all(16),
            itemCount: products?.length,
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemBuilder: (context, index) {
              final item = products?[index] ?? {};
              return _ItemProductWidget(
                product: item,
                productsPromotion: productsPromotion,
              );
            },
          )
        : const SizedBox.shrink();
  }
}

// --------------------- Cach 1
// class ProductsScreen extends ConsumerWidget {
//   const ProductsScreen({super.key});
//
//   static const String nameRoute = 'products';
//   static const String pathRoute = '/products';
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final result = ref.watch(allProductProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sản phẩm'),
//         centerTitle: false,
//       ),
//       body: (result.isLoading == false)
//           ? (!Helper.isNull(result.products))
//               ? AlignedGridView.count(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: result.products?.length,
//                   crossAxisCount: 2,
//                   shrinkWrap: true,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   itemBuilder: (context, index) {
//                     final item = result.products?[index] ?? {};
//                     return _ItemProductWidget(product: item);
//                   },
//                 )
//               : const SizedBox.shrink()
//           : const Center(
//               child: CircularProgressIndicator.adaptive(),
//             ),
//     );
//   }
// }

// ---------------------- Cach 2
// class ProductsScreen extends ConsumerWidget {
//   const ProductsScreen({super.key});
//
//   static const String nameRoute = 'products';
//   static const String pathRoute = '/products';
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     AsyncValue asyncValue = ref.watch(allProductProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sản phẩm'),
//         centerTitle: false,
//       ),
//       body: asyncValue.when(
//         data: (data) {
//           final result = data['data'];
//           if (!Helper.isNull(result)) {
//             return AlignedGridView.count(
//               padding: const EdgeInsets.all(16),
//               itemCount: result.length,
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               itemBuilder: (context, index) {
//                 final item = result[index];
//                 return _ItemProductWidget(product: item);
//               },
//             );
//           }
//           return const SizedBox.shrink();
//         },
//         error: (error, stackTrace) => Center(child: Text(error.toString())),
//         loading: () => const Center(
//           child: CircularProgressIndicator.adaptive(),
//         ),
//       ),
//     );
//   }
// }
