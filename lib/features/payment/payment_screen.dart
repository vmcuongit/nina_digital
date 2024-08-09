import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/mixins/ui_mixins.dart';
import 'doi_dia_chi_screen.dart';
import 'phuong_thuc_van_chuyen_screen.dart';
import 'providers/payment_provider.dart';

part 'widgets/custom_icon_widget.dart';
part 'widgets/wrap_content_widget.dart';
part 'widgets/diachi_widget.dart';
part 'widgets/products_widget.dart';
part 'widgets/item_cart_widget.dart';
part 'widgets/vanchuyen_widget.dart';
part 'widgets/makhuyenmai_widget.dart';
part 'widgets/total_widget.dart';

class PaymentScreen extends ConsumerWidget with UiMixins {
  const PaymentScreen({super.key});

  static const String nameRoute = 'payment';
  static const String pathRoute = '/payment';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toan'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _DiachiWidget(),
              const SizedBox(
                height: 30,
              ),
              _ProductsWidget(),
              const SizedBox(
                height: 30,
              ),
              _VanchuyenWidget(),
              const SizedBox(
                height: 30,
              ),
              _MakhuyenmaiWidget(),
              const SizedBox(
                height: 30,
              ),
              _TotalWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customButtonBottomNavigationBarTypeRadius(
        context,
        text: 'Tiếp tục',
        onPressed: () {},
      ),
    );
  }
}
