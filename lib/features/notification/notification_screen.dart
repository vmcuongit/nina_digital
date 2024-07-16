import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/mixins/ui_mixins.dart';

part 'widgets/item_noti_widget.dart';

class NotificationScreen extends ConsumerWidget with UiMixins {
  const NotificationScreen({super.key});

  static const String nameRoute = 'notification';
  static const String pathRoute = '/notification';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông báo'),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        itemBuilder: (context, index) {
          return _ItemNotiWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 25),
        itemCount: 10,
      ),
    );
  }
}
