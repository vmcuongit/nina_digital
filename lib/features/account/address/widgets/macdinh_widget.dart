part of '../address_detail_screen.dart';

class _MacDinhWidget extends StatefulWidget {
  const _MacDinhWidget({super.key});

  @override
  State<_MacDinhWidget> createState() => _MacDinhWidgetState();
}

class _MacDinhWidgetState extends State<_MacDinhWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: isCheck,
      title: Text(
        'Sử dụng làm địa chỉ mặc định',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      onChanged: (value) {
        setState(() {
          isCheck = value!;
        });
      },
    );
  }
}
