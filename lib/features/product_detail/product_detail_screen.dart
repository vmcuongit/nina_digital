import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/constants/media_assets.dart';

part 'widgets/images_product_widget.dart';
part 'widgets/quantity_widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.id});

  static const String nameRoute = 'product-detail';
  static const String pathRoute = '/product-detail/:id';

  final String id;

  @override
  ConsumerState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ImagesProductWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: MediaQuery.of(context).viewPadding.bottom,
            top: 5),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xfff2f2f2))),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Số lượng',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 8,
                ),
                _QuantityWidget(),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: FilledButton.icon(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined),
                label: Text(
                  'Thêm vào giỏ hàng',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
