import 'package:flutter/material.dart';

import '../../shared/mixins/ui_mixins.dart';

class FavoriteScreen extends StatelessWidget with UiMixins {
  const FavoriteScreen({super.key});

  static const String nameRoute = 'favorite';
  static const String pathRoute = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarType1(context, text: 'Danh sách yêu thích'),
      body: Center(
        child: Text('favorite'),
      ),
    );
  }
}
