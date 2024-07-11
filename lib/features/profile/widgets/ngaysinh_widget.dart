part of '../profile_screen.dart';

class _NgaySinhWidget extends ConsumerStatefulWidget {
  const _NgaySinhWidget({super.key});

  @override
  ConsumerState createState() => __NgaySinhWidgetState();
}

class __NgaySinhWidgetState extends ConsumerState<_NgaySinhWidget>
    with FormMixins {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? selDate;

  @override
  void initState() {
    super.initState();
    selDate = DateTime.now();
    _textEditingController.text = DateTime.now().formatDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return customTextFormField(
      context,
      readOnly: true,
      controller: _textEditingController,
      labelText: 'Ngày sinh',
      labelStyle: _labelStyle,
      fillColor: _fillColor,
      contentPadding: _contentPadding,
      onTap: () async {
        selDate = await Helper.onSelectDate(context);
        setState(() {
          _textEditingController.text = selDate!.formatDateTime();
        });
      },
    );
  }
}
