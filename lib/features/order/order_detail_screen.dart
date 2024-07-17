import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';

part 'widgets/order_detail/products_in_cart_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.code});

  static const String nameRoute = 'order-detail';
  static const String pathRoute = ':code';

  final String code;

  @override
  Widget build(BuildContext context) {
    final _colorIcon = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: icons.Page(
                      color: _colorIcon,
                      width: 25,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(text: 'Mã đơn hàng: '),
                                TextSpan(
                                    text: 'SDF123123',
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Ngày đặt hàng: 16:24, 30/12/2023',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Đã giao hàng',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xfff2f2f2),
              thickness: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: icons.MapPin(
                      color: _colorIcon,
                      width: 25,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Địa chỉ người nhận',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Vũ Mạnh Cường',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '0909 845 849',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '12321 Bình Long, Phường Bình Hưng Hoà A, Quận Bình Tân, Hồ Chí Minh',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xfff2f2f2),
              thickness: 10,
            ),
            _ProductsInCartWidget(),
            const Divider(
              color: Color(0xfff2f2f2),
              thickness: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: icons.DeliveryTruck(
                      color: _colorIcon,
                      width: 28,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hình thức giao hàng',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Giao hàng tiết kiệm',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xfff2f2f2),
              thickness: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: icons.Wallet(
                      color: _colorIcon,
                      width: 28,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hình thức thanh toán',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Thanh toán khi nhận hàng',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xfff2f2f2),
              thickness: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tạm tính',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        '105.000.000 đ',
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xfff2f2f),
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phí vận chuyển',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        '+ 98.000 đ',
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xfff2f2f),
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Khuyến mãi',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        '- 1.000.000 đ',
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xfff2f2f),
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thành tiền',
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '103.098.000 đ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('Đã bao gồm VAT nếu có')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xfff2f2f2),
              thickness: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 5,
          bottom: MediaQuery.of(context).viewPadding.bottom + 5,
        ),
        decoration: BoxDecoration(border: Border.all(color: Color(0xfff2f2f2))),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'Mua lại',
                style: TextStyle(fontSize: 16),
              )),
        ),
      ),
    );
  }
}
