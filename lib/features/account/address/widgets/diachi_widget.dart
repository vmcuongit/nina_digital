part of '../address_detail_screen.dart';

class _DiaChiWidget extends StatelessWidget with FormMixins {
  const _DiaChiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Địa chỉ nhận hàng',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
        customTextFormField(
          context,
          hintText: 'Toà nhà, số nhà, tên đường',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
