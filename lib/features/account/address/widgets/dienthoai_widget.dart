part of '../address_detail_screen.dart';

class _DienThoaiWidget extends StatelessWidget with FormMixins {
  const _DienThoaiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Số điện thoại',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
        customTextFormField(
          context,
          hintText: 'Nhập số điện thoại',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
