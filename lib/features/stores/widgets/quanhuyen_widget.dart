part of '../stores_screen.dart';

class _QuanHuyenWidget extends StatelessWidget with FormMixins {
  const _QuanHuyenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return customDropdownButtonFormField(
      context,
      hintText: 'Chọn Quận/Huyện',
    );
  }

  Widget _defaultWidget(BuildContext context) {
    return customDropdownButtonFormField(
      context,
      hintText: 'Chọn Quận/Huyện',
      value: 0,
    );
  }
}
