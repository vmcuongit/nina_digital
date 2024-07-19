import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/common_widgets/gallery_photo/gallery_photo_view_widget.dart';
import '../../shared/constants/media_assets.dart';
import '../../shared/extensions/context_ext.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../../shared/utils/helper.dart';
import '../reviews_product/reviews_product_screen.dart';
import 'providers/offset_scroll_provider.dart';

part 'widgets/images_product_widget.dart';
part 'widgets/description_widget.dart';
part 'widgets/revivew_widget.dart';
part 'widgets/products_other_widget.dart';
part 'widgets/quantity_widget.dart';
part 'widgets/add_cart_widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.id});

  static const String nameRoute = 'product-detail';
  static const String pathRoute = '/product-detail/:id';

  final String id;

  @override
  ConsumerState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen>
    with UiMixins {
  final ScrollController _scrollController = ScrollController();
  final double _showOffset = 500.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenerScrollController);
  }

  _listenerScrollController() {
    if (_scrollController.offset > _showOffset) {
      ref.read(offsetScrollProductDetailProvider.notifier).update(true);
    } else {
      ref.read(offsetScrollProductDetailProvider.notifier).update(false);
    }
  }

  _onGoTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _ImagesProductWidget(),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Apple iPhone 14 Pro Max 128Gb',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: icons.HeartSolid(
                            width: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  showStar(number: 4, size: 20),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '29.390.000đ',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '35.590.000đ',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xfff2f2f2),
                    height: 40,
                  ),
                  Text(
                    'Màu sắc: Gold',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Wrap(
                      children: [
                        _colorProduct(
                            image: '${MediaAssets.images}/sp.jpg',
                            active: true),
                        _colorProduct(image: '${MediaAssets.images}/sp.jpg'),
                        _colorProduct(image: '${MediaAssets.images}/sp.jpg'),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xfff2f2f2),
                    height: 30,
                  ),
                  _DescriptionWidget(),
                  const Divider(
                    color: Color(0xfff2f2f2),
                    height: 30,
                  ),
                  _RevivewWidget(),
                  const Divider(
                    color: Color(0xfff2f2f2),
                    height: 30,
                  ),
                  _ProductsOtherWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _AddCartWidget(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return Visibility(
            visible: ref.watch(offsetScrollProductDetailProvider),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: _onGoTop,
              child: Icon(
                Icons.vertical_align_top_rounded,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _colorProduct({required String image, bool active = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 15, bottom: 15),
      width: 75,
      height: 75,
      decoration: BoxDecoration(
          border: Border.all(
              color: (active == true)
                  ? Theme.of(context).primaryColor
                  : const Color(0xfff2f2f2))),
      child: Image.asset(
        image,
        fit: BoxFit.fitHeight,
        opacity: (active == false) ? const AlwaysStoppedAnimation(0.5) : null,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
