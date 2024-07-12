part of '../address_detail_screen.dart';

class _LoaiDiaChi extends StatefulWidget {
  const _LoaiDiaChi({super.key});

  @override
  State<_LoaiDiaChi> createState() => _LoaiDiaChiState();
}

class _LoaiDiaChiState extends State<_LoaiDiaChi> {
  int active = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loại địa chỉ'),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 15,
          direction: Axis.horizontal,
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('Nhà'),
              icon: Icon(
                Icons.house,
              ),
            ),
            OutlinedButton.icon(
              style: const ButtonStyle(
                side: WidgetStatePropertyAll(BorderSide(color: Colors.black54)),
              ),
              onPressed: () {},
              label: Text(
                'Văn phòng ',
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.business_sharp,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
            'Đơn hàng sẽ được giao cho bạn vào giờ hành chính, từ thứ Hai đến thứ Sáu'),
        Text('Đơn hàng sẽ được giao cho bạn vào tất cả các ngày trong tuần'),
      ],
    );
  }
}
