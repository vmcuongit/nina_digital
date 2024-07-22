part of '../search_product_screen.dart';

class _FilterDanhmucWidget extends StatefulWidget {
  const _FilterDanhmucWidget({super.key});

  @override
  State<_FilterDanhmucWidget> createState() => _FilterDanhmucWidgetState();
}

class _FilterDanhmucWidgetState extends State<_FilterDanhmucWidget> {
  int _indexActive = 0;

  void _updateActive(int index) {
    setState(() {
      _indexActive = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Danh mục',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _itemFilter(
                context,
                label: 'All',
                active: (_indexActive == 0) ? true : false,
                onTap: () {
                  _updateActive(0);
                },
              ),
              _itemFilter(
                context,
                label: 'Điện thoại',
                active: (_indexActive == 1) ? true : false,
                onTap: () {
                  _updateActive(1);
                },
              ),
              _itemFilter(
                context,
                label: 'Máy tính bảng',
                active: (_indexActive == 2) ? true : false,
                onTap: () {
                  _updateActive(2);
                },
              ),
              _itemFilter(
                context,
                label: 'Laptop',
                active: (_indexActive == 3) ? true : false,
                onTap: () {
                  _updateActive(3);
                },
              ),
              _itemFilter(
                context,
                label: 'Âm thanh',
                active: (_indexActive == 4) ? true : false,
                onTap: () {
                  _updateActive(4);
                },
              ),
              _itemFilter(
                context,
                label: 'Đồng hồ',
                active: (_indexActive == 5) ? true : false,
                onTap: () {
                  _updateActive(5);
                },
              ),
              _itemFilter(
                context,
                label: 'PC',
                active: (_indexActive == 6) ? true : false,
                onTap: () {
                  _updateActive(6);
                },
              ),
              _itemFilter(
                context,
                label: 'Phụ kiện',
                active: (_indexActive == 7) ? true : false,
                onTap: () {
                  _updateActive(7);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
