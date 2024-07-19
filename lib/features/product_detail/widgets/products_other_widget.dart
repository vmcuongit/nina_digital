part of '../product_detail_screen.dart';

class _ProductsOtherWidget extends ConsumerWidget {
  const _ProductsOtherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sản phẩm liên quan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _itemProduct(context);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: 10,
          ),
        )
      ],
    );
  }

  Widget _itemProduct(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(ProductDetailScreen.nameRoute,
            pathParameters: {'id': '1'});
      },
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  '${MediaAssets.images}/sp.jpg',
                  fit: BoxFit.fitHeight,
                  height: 120,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: 16,
                    backgroundColor: Colors.red,
                    child: Text(
                      '-20%',
                      style: TextStyle(
                        fontSize: 10,
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 7,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '29.390.000đ',
                  style: TextStyle(color: Colors.redAccent, fontSize: 13),
                ),
                Text(
                  '35.390.000đ',
                  style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xff555555)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
