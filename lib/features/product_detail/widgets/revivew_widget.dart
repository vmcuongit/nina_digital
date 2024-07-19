part of '../product_detail_screen.dart';

class _RevivewWidget extends ConsumerWidget with UiMixins {
  const _RevivewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Đánh giá',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                print('xem tat ca danh gia');
              },
              child: Text(
                'Xem thêm',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showStar(number: 4, size: 20),
            const SizedBox(
              width: 10,
            ),
            Text(
              '4.5',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '(5 nhận xét)',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _itemReview();
          },
          separatorBuilder: (context, index) =>
              const Divider(color: Color(0xfff2f2f2), height: 30),
          itemCount: 2,
        )
      ],
    );
  }
}

class _itemReview extends ConsumerWidget with UiMixins {
  const _itemReview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 46,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(46),
                child: Image.asset('${MediaAssets.images}/avatar.jpg'),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Nguyễn Thị Quỳnh Búp Bê',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    showStar(number: 5, size: 16),
                  ],
                )),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          '20/08/2023 18:52',
          style: TextStyle(fontSize: 12, color: Colors.black45),
        ),
      ],
    );
  }
}
