part of '../address_detail_screen.dart';

class _PhuongXaWidget extends StatelessWidget with FormMixins {
  const _PhuongXaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phường/Xã',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
        _selectPhuongXaWidget(),
      ],
    );
  }
}

class _selectPhuongXaWidget extends ConsumerWidget with FormMixins {
  const _selectPhuongXaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customDropdownButtonFormField(
      context,
      hintText: 'Chọn Phường/Xã',
    );
  }

  Widget _defaultWidget(BuildContext context) {
    return customDropdownButtonFormField(
      context,
      hintText: 'Chọn Phường/Xã',
      value: 0,
    );
  }
}
