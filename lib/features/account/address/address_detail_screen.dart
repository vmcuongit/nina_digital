import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/extensions/context_ext.dart';
import '../../../shared/mixins/form_mixin.dart';
import 'providers/address_provider.dart';

part 'widgets/hoten_widget.dart';
part 'widgets/dienthoai_widget.dart';
part 'widgets/tinhthanh_widget.dart';
part 'widgets/quanhuyen_widget.dart';
part 'widgets/phuongxa_widget.dart';
part 'widgets/diachi_widget.dart';
part 'widgets/loai_diachi_widget.dart';
part 'widgets/macdinh_widget.dart';

final GlobalKey<FormState> _keyFormAddress = GlobalKey<FormState>();

class AddressDetailScreen extends ConsumerStatefulWidget {
  const AddressDetailScreen({super.key, this.id, this.from});

  static const String nameRouteAdd = 'add-address';
  static const String nameRouteEdit = 'address-detail';

  static const String pathRouteEdit = '/address-detail/:id';
  static const String pathRouteAdd = '/add-address';

  final String? id;
  final String? from;

  @override
  ConsumerState createState() => _AddressDetailScreenState();
}

class _AddressDetailScreenState extends ConsumerState<AddressDetailScreen>
    with FormMixins {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        title: (widget.id != null)
            ? Text('Cập nhật địa chỉ')
            : Text('Thêm địa chỉ mới'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _keyFormAddress,
          child: Column(
            children: [
              _khungContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HotenWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _DienThoaiWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _TinhThanhWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _QuanHuyenWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _PhuongXaWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _DiaChiWidget(),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _khungContainer(child: _LoaiDiaChi()),
              const SizedBox(
                height: 10,
              ),
              _khungContainer(child: _MacDinhWidget()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: context.getViewPaddingBottom()),
        child: customButton(
          context,
          text: (widget.id != null) ? 'Cập nhật' : 'Lưu',
          background: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onTap: () {
            if (widget.from == 'payment') {
              print('from payment');
            }
            ref.read(addressProvider.notifier).createAddress();
          },
        ),
      ),
    );
  }

  Widget _khungContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: child,
    );
  }
}
