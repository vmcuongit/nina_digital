part of '../home_screen.dart';

class _ProductHomeWidget extends StatelessWidget {
  _ProductHomeWidget({super.key});

  final List danhmuc = [
    'All',
    'Điện thoại',
    'Smartwatch',
    'Máy tính bảng',
    'Phụ kiện',
    'Laptop',
    'Loa- Tai nghe',
    'Máy chiếu',
    'Gia dụng',
  ];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Sản Phẩm Nổi Bật',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 21,
                    ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Tất cả',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              reverse: false,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Chip(
                  label: Text(
                    danhmuc[index],
                    style: TextStyle(color: (index == 0) ? Colors.white : null),
                  ),
                  color: (index == 0)
                      ? WidgetStatePropertyAll(Theme.of(context).primaryColor)
                      : null,
                  shape: StadiumBorder(
                    side: BorderSide(
                        color: (index == 0) ? Colors.white : Colors.grey),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: danhmuc.length,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AlignedGridView.count(
            padding: const EdgeInsets.all(0),
            itemCount: 6,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemBuilder: (context, index) {
              return _itemProduct(context);
            },
          )
        ],
      ),
    );
  }
}
