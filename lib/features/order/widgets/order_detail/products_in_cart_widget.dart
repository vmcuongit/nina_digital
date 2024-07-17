part of '../../order_detail_screen.dart';

class _ProductsInCartWidget extends ConsumerWidget {
  const _ProductsInCartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _itemProduct();
        },
        separatorBuilder: (context, index) => const Divider(
          color: Color(0xfff2f2f2),
        ),
        itemCount: 3,
      ),
    );
  }

  Widget _itemProduct() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          margin: const EdgeInsets.only(right: 15),
          child: Image.asset(
            '${MediaAssets.images}/sp.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'iPhone 14 Pro Max 128Gb',
                style: TextStyle(fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Màu: Gold',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  Text(
                    'Số lượng: 2',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '135.000.000đ',
                    style: TextStyle(fontSize: 13, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
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
      ],
    );
  }
}
