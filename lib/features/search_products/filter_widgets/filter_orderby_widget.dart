part of '../search_product_screen.dart';

class _FilterOrderbyWidget extends StatefulWidget {
  const _FilterOrderbyWidget({super.key});

  @override
  State<_FilterOrderbyWidget> createState() => _FilterOrderbyWidgetState();
}

class _FilterOrderbyWidgetState extends State<_FilterOrderbyWidget> {
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
            'Sắp xếp theo',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _itemFilter(
              context,
              label: 'Giá thấp - cao',
              active: (_indexActive == 1) ? true : false,
              onTap: () {
                _updateActive(1);
              },
            ),
            _itemFilter(
              context,
              label: 'Giá cao - thấp',
              active: (_indexActive == 2) ? true : false,
              onTap: () {
                _updateActive(2);
              },
            ),
            _itemFilter(
              context,
              label: 'Mới',
              active: (_indexActive == 3) ? true : false,
              onTap: () {
                _updateActive(3);
              },
            ),
            _itemFilter(
              context,
              label: 'Xem nhiều',
              active: (_indexActive == 4) ? true : false,
              onTap: () {
                _updateActive(4);
              },
            ),
          ],
        ),
      ],
    );
  }
}
