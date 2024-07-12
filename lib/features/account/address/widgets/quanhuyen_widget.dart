part of '../address_detail_screen.dart';

class _QuanHuyenWidget extends StatelessWidget with FormMixins {
  const _QuanHuyenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quận/Huyện',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
        _selectQuanHuyenWidget(),
      ],
    );
  }
}

class _selectQuanHuyenWidget extends ConsumerWidget with FormMixins {
  const _selectQuanHuyenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
