part of '../payment_screen.dart';

class _ProductsWidget extends ConsumerWidget {
  const _ProductsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sản phẩm',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 15),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const _ItemCartWidget();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 3,
        ),
      ],
    );
  }
}
