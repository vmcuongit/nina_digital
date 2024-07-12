part of '../address_detail_screen.dart';

class _HotenWidget extends StatelessWidget with FormMixins {
  const _HotenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tên người nhận',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
        customTextFormField(
          context,
          hintText: 'Nhập Họ tên',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
