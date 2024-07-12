import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/ui_mixins.dart';

class FavoriteScreen extends StatelessWidget with UiMixins {
  const FavoriteScreen({super.key});

  static const String nameRoute = 'favorite';
  static const String pathRoute = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarType1(context, text: 'Danh sách yêu thích'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: AlignedGridView.count(
            padding: const EdgeInsets.all(0),
            itemCount: 3,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemBuilder: (context, index) {
              return _itemProduct(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _itemProduct(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('chi tiet sp');
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  '${MediaAssets.images}/sp.jpg',
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: 18,
                    backgroundColor: Colors.red,
                    child: Text(
                      '-20%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'iPhone 14 Pro Max 256Gb VN/A',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 7,
            ),
            Wrap(
              spacing: 10,
              children: [
                Text(
                  '29.390.000đ',
                  style: TextStyle(color: Colors.redAccent, fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    '35.390.000đ',
                    style: TextStyle(
                        fontSize: 12, decoration: TextDecoration.lineThrough),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
