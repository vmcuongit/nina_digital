part of '../search_product_screen.dart';

class _FilterThuonghieuWidget extends StatefulWidget {
  const _FilterThuonghieuWidget({super.key});

  @override
  State<_FilterThuonghieuWidget> createState() =>
      _FilterThuonghieuWidgetState();
}

class _FilterThuonghieuWidgetState extends State<_FilterThuonghieuWidget> {
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
            'Thương hiệu',
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
                label: 'Apple',
                active: (_indexActive == 1) ? true : false,
                onTap: () {
                  _updateActive(1);
                },
              ),
              _itemFilter(
                context,
                label: 'Samsung',
                active: (_indexActive == 2) ? true : false,
                onTap: () {
                  _updateActive(2);
                },
              ),
              _itemFilter(
                context,
                label: 'Oppo',
                active: (_indexActive == 3) ? true : false,
                onTap: () {
                  _updateActive(3);
                },
              ),
              _itemFilter(
                context,
                label: 'Xiaomi',
                active: (_indexActive == 4) ? true : false,
                onTap: () {
                  _updateActive(4);
                },
              ),
              _itemFilter(
                context,
                label: 'Vivo',
                active: (_indexActive == 5) ? true : false,
                onTap: () {
                  _updateActive(5);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
