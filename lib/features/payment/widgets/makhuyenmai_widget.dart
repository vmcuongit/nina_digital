part of '../payment_screen.dart';

class _MakhuyenmaiWidget extends ConsumerWidget with FormMixins {
  const _MakhuyenmaiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mã khuyến mãi',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: customTextFormField(context,
                    hintText: 'Nhập mã khuyến mãi',
                    borderRadius: 50,
                    fillColor: const Color(0xfff2f2f2),
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.black45))),
            const SizedBox(width: 15),
            SizedBox(
              width: 45,
              height: 45,
              child: IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 18,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
