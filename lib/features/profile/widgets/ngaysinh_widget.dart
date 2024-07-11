part of '../profile_screen.dart';

class _NgaySinhWidget extends ConsumerWidget with FormMixins {
  const _NgaySinhWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customTextFormField(
      context,
      readOnly: true,
      labelText: 'Ngày sinh',
      labelStyle: _labelStyle,
      initialValue: '26/11/1991',
      fillColor: _fillColor,
      contentPadding: _contentPadding,
      onTap: () async {
        final selDate = await Helper.onSelectDate(context);
        print(selDate);
      },
    );
  }
}
