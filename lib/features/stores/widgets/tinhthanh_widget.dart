part of '../stores_screen.dart';

class _TinhThanhWidget extends StatelessWidget with FormMixins {
  const _TinhThanhWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
