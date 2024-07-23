import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/mixins/form_mixin.dart';

class PhuongThucVanChuyenScreen extends ConsumerStatefulWidget {
  const PhuongThucVanChuyenScreen({super.key});

  static const String nameRoute = 'phuong-thuc-van-chuyen';
  static const String pathRoute = '/phuong-thuc-van-chuyen';

  @override
  ConsumerState createState() => _PhuongThucVanChuyenScreenState();
}

class _PhuongThucVanChuyenScreenState
    extends ConsumerState<PhuongThucVanChuyenScreen> with FormMixins {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phương thức vận chuyển'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemVanChuyen(
                title: 'Tiêu chuẩn',
                description: 'Thời gian giao hàng dự kiện 2-3 ngày làm việc',
                onTap: () {
                  _onChanged();
                },
                value: _selected,
                groupValue: 0,
              ),
              const SizedBox(
                height: 20,
              ),
              _itemVanChuyen(
                title: 'Hoả tốc',
                description: 'Thời gian giao hàng trong 24h',
                onTap: () {
                  _onChanged();
                },
                value: _selected,
                groupValue: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customIconWidget(BuildContext context, {required Widget child}) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _wrapContentWidget({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3)
        ],
      ),
      child: child,
    );
  }

  Widget _itemVanChuyen<T>({
    required String title,
    String? description,
    required T value,
    required T groupValue,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: _wrapContentWidget(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customIconWidget(
              context,
              child: const icons.Cube(
                height: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 30,
              child: Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: (value) {
                  onTap;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onChanged() {
    Navigator.of(context).pop();
  }
}
