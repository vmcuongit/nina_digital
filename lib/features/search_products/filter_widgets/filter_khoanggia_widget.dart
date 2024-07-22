part of '../search_product_screen.dart';

class _FilterKhoanggiaWidget extends ConsumerStatefulWidget {
  const _FilterKhoanggiaWidget({super.key});

  @override
  ConsumerState createState() => __FilterKhoanggiaWidgetState();
}

class __FilterKhoanggiaWidgetState extends ConsumerState<_FilterKhoanggiaWidget>
    with FormMixins {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  int _indexActive = 0;

  void _onStartChanged(value) {
    value = value.toString().replaceAll('.', '');
    setState(() {
      _startController.text =
          (value != '') ? Helper.numberFormat(double.parse(value)) : '';
    });
  }

  void _onEndChanged(value) {
    value = value.toString().replaceAll('.', '');
    setState(() {
      _endController.text =
          (value != '') ? Helper.numberFormat(double.parse(value)) : '';
    });
  }

  void _updateActive(int index) {
    setState(() {
      _startController.text = '';
      _endController.text = '';
      _indexActive = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Khoảng giá',
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: customTextFormField(
                    context,
                    controller: _startController,
                    isDense: true,
                    hintText: 'Tối thiểu',
                    hintStyle: const TextStyle(fontSize: 14),
                    onChanged: _onStartChanged,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: customTextFormField(
                    context,
                    controller: _endController,
                    isDense: true,
                    hintText: 'Tối đa',
                    hintStyle: const TextStyle(fontSize: 14),
                    onChanged: _onEndChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _itemFilter(
              context,
              fontSize: 12,
              label: 'Dưới 5.000.000',
              active: (_indexActive == 1) ? true : false,
              onTap: () {
                _updateActive(1);
              },
            ),
            _itemFilter(
              context,
              fontSize: 12,
              label: '5.000.000 - 10.000.000',
              active: (_indexActive == 2) ? true : false,
              onTap: () {
                _updateActive(2);
              },
            ),
            _itemFilter(
              context,
              fontSize: 12,
              label: '10.000.000 - 15.000.000',
              active: (_indexActive == 3) ? true : false,
              onTap: () {
                _updateActive(3);
              },
            ),
            _itemFilter(
              context,
              fontSize: 12,
              label: '15.000.000 - 20.000.000',
              active: (_indexActive == 4) ? true : false,
              onTap: () {
                _updateActive(4);
              },
            ),
            _itemFilter(
              context,
              fontSize: 12,
              label: 'Trên 20.000.000',
              active: (_indexActive == 5) ? true : false,
              onTap: () {
                _updateActive(5);
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _startController.dispose();
    _endController.dispose();
  }
}
