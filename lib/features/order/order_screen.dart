import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/constants/media_assets.dart';
import 'order_detail_screen.dart';

part 'widgets/order/list_order_by_type_widget.dart';
part 'widgets/order/empty_order_widget.dart';
part 'widgets/order/item_order_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const String nameRoute = 'order';
  static const String pathRoute = '/order';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng'),
        centerTitle: false,
      ),
      body: DefaultTabController(
        length: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: _tabController,
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(
                  text: 'Tất cả',
                ),
                Tab(
                  text: 'Mới đặt',
                ),
                Tab(
                  text: 'Đang xử lý',
                ),
                Tab(
                  text: 'Đang vận chuyển',
                ),
                Tab(
                  text: 'Đã giao',
                ),
                Tab(
                  text: 'Đã huỷ',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _ListOrderByTypeWidget(type: 0),
                  _ListOrderByTypeWidget(type: 1),
                  _ListOrderByTypeWidget(type: 2),
                  _ListOrderByTypeWidget(type: 3),
                  _ListOrderByTypeWidget(type: 4),
                  _ListOrderByTypeWidget(type: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
