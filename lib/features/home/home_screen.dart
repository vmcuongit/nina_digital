import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/mixins/ui_mixins.dart';

class HomeScreen extends ConsumerWidget with FormMixins, UiMixins {
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
            expandedHeight: 160,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 20,
                    left: 20,
                    right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: CircleAvatar(
                        maxRadius: 55,
                        minRadius: 55,
                        child: Image.asset(
                          '${MediaAssets.images}/avatar.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Vu Manh Cuong',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(top: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: customBadgeIcon(context,
                                icon: SvgPicture.asset(
                                  '${MediaAssets.icons}/noti.svg',
                                  width: 32,
                                ),
                                label: null),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: customBadgeIcon(context,
                                icon: SvgPicture.asset(
                                  '${MediaAssets.icons}/bag.svg',
                                  width: 32,
                                ),
                                label: '10'),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(24),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: customTextFormField(context, onTap: () {
                  print('chuyen qua man hinh tim kiem');
                },
                    hintText: 'Tìm kiếm',
                    fillColor: const Color(0xffEBEBEB),
                    borderRadius: 15,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: icons.Search(
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: icons.Filter(),
                    )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                for (var i = 1; i <= 25; i++)
                  ListTile(
                    title: Text('$i'),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
