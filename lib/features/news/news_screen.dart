import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/ui_mixins.dart';
import 'news_detail_screen.dart';

class NewsScreen extends StatelessWidget with UiMixins {
  const NewsScreen({super.key});

  static const String nameRoute = 'news';
  static const String pathRoute = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarType1(context, text: 'Tin tức'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              _newsBig(context),
              const SizedBox(
                height: 20,
              ),
              _newsSmall(context, id: '2'),
              const Divider(color: Color(0xfff2f2f2), height: 30),
              _newsSmall(context, id: '3'),
              const Divider(color: Color(0xfff2f2f2), height: 30),
              _newsSmall(context, id: '4'),
              const Divider(color: Color(0xfff2f2f2), height: 30),
              _newsSmall(context, id: '5'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newsBig(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .pushNamed(NewsDetailScreen.nameRoute, pathParameters: {'id': '1'});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              '${MediaAssets.images}/img_news.jpg',
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Apple nâng cấp iOS 16.3 với những tính năng nổi bật',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Sau một thời gian thử nghiệm, Apple chính thức công bố sự ra mắt của iOS 16.3 với những tính năng thông minh mới, khắc phục một số lỗi cơ bản như lỗi sọc màn hình trên dòng',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _newsSmall(BuildContext context, {required String id}) {
    return GestureDetector(
      onTap: () {
        context
            .pushNamed(NewsDetailScreen.nameRoute, pathParameters: {'id': id});
      },
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Image.asset(
              '${MediaAssets.images}/img_news.jpg',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xiaomi ra mắt siêu phẩm công nghệ Smartphone',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Ngày đăng: 07/02/2024',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
