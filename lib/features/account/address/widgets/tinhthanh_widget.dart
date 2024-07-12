part of '../address_detail_screen.dart';

class _TinhThanhWidget extends StatelessWidget with FormMixins {
  const _TinhThanhWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tỉnh/Thành phố',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
        _selectTinhThanhWidget(),
      ],
    );
  }
}

class _selectTinhThanhWidget extends ConsumerWidget with FormMixins {
  const _selectTinhThanhWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customDropdownButtonFormField(
      context,
      hintText: 'Chọn Tỉnh/Thành phố',
      value: 1,
      items: [
        DropdownMenuItem(
          child: Text('TP. Ho Chi Minh'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Ha Noi'),
          value: 2,
        ),
      ],
      onChanged: (value) {},
    );
  }

  Widget _defaultWidget(BuildContext context) {
    return customDropdownButtonFormField(
      context,
      hintText: 'Chọn Tỉnh/Thành phố',
      value: 0,
    );
  }
}
