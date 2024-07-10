import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../search_products/search_product_screen.dart';

part 'widgets/header_home_widget.dart';
part 'widgets/search_home_widget.dart';
part 'widgets/body_home_widget.dart';
part 'widgets/slider_widget.dart';
part 'widgets/category_widget.dart';
part 'widgets/ad_widget.dart';
part 'widgets/product_home_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String nameRoute = 'home';
  static const String pathRoute = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 145,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 20,
                    left: 20,
                    right: 20),
                child: _HeaderHomeWidget(),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(12),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 0),
                child: _SearchHomeWidget(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _BodyHomeWidget(),
          ),
        ],
      ),
    );
  }
}
