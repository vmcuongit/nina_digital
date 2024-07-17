import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';

part 'widgets/item_cart_widget.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  static const String nameRoute = 'shopping-cart';
  static const String pathRoute = '/shopping-cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 20, bottom: 30),
        itemBuilder: (context, index) {
          return const _ItemCartWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 3,
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tạm tính',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '103.000.000đ',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: FilledButton(
                style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ))),
                onPressed: () {},
                child: Text(
                  'Thanh toán',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
