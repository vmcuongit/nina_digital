import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/common_widgets/gallery_photo/gallery_photo_view_widget.dart';
import '../../shared/constants/media_assets.dart';
import '../../shared/extensions/context_ext.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../../shared/utils/helper.dart';

part 'widgets/item_review_widget.dart';

class ReviewsProductScreen extends StatelessWidget with FormMixins {
  const ReviewsProductScreen({super.key, required this.id});

  static const String nameRoute = 'reviews-product';
  static const String pathRoute = '/reviews-product/:id';
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5 nhận xét'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 38,
                margin: const EdgeInsets.only(bottom: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    6,
                    (index) {
                      return _itemFilterRV(context,
                          onTap: () {},
                          star: index,
                          active: (index == 0) ? true : false);
                    },
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _ItemReviewWidget();
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: Color(0xfff2f2f2), height: 50),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: context.getViewPaddingBottom()),
        child: customButton(
          context,
          text: 'Viết đánh giá',
          background: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _itemFilterRV(BuildContext context,
      {required Function() onTap, required int star, bool active = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color:
              (active) ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
          border: Border.all(
              color: (active)
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : const Color(0xffbbbbbb)),
        ),
        child: (star == 0)
            ? Text(
                'Tất cả',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: (active) ? FontWeight.bold : null,
                    color: (active) ? Theme.of(context).primaryColor : null),
              )
            : Row(
                children: [
                  const icons.StarSolid(
                    color: Color(0xffFFC833),
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '$star',
                      style: TextStyle(
                        color: (active) ? Theme.of(context).primaryColor : null,
                        fontWeight: (active) ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
