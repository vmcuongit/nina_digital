import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/ui_mixins.dart';

class ProductCategoryScreen extends StatelessWidget with UiMixins {
  const ProductCategoryScreen({super.key});

  static const String nameRoute = 'product-category';
  static const String pathRoute = '/product-category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarType1(context, text: 'Danh mục sản phẩm'),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: GridView.builder(
            reverse: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              mainAxisExtent: 140,
            ),
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, index) {
              return _itemCategory();
            },
          ),
        ),
      ),
    );
  }

  Widget _itemCategory() {
    return GestureDetector(
      onTap: () {
        print('vo danh muc san pham');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(80)),
            child: Image.asset(
              '${MediaAssets.images}/danhmuc.jpg',
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Loa - Tai nghe',
            style: TextStyle(fontSize: 15),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
