import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';

part 'widgets/custom_icon_widget.dart';
part 'widgets/wrap_content_widget.dart';
part 'widgets/diachi_widget.dart';
part 'widgets/products_widget.dart';
part 'widgets/item_cart_widget.dart';
part 'widgets/vanchuyen_widget.dart';
part 'widgets/makhuyenmai_widget.dart';
part 'widgets/total_widget.dart';

class PaymentScreen extends ConsumerWidget {
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: MediaQuery.of(context).viewPadding.bottom + 10,
          top: 20,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 40,
                spreadRadius: 4,
              ),
            ]),
        child: FilledButton(
          style: const ButtonStyle(
              padding:
                  WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ))),
          onPressed: () {},
          child: Text(
            'Tiếp tục',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
