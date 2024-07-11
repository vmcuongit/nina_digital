part of '../profile_screen.dart';

class _GioiTinhWidget extends ConsumerWidget with FormMixins {
  const _GioiTinhWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return customDropdownButtonFormField(
      context,
      fillColor: _fillColor,
      contentPadding: _contentPadding,
      labelText: 'Giới tính',
      labelStyle: _labelStyle,
      value: 0,
      items: [
        DropdownMenuItem(
          child: Text('Nam'),
          value: 0,
        ),
        DropdownMenuItem(
          child: Text('Nữ'),
          value: 1,
        ),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {},
    );
  }
}
