import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../../shared/utils/helper.dart';

part 'widgets/tinhthanh_widget.dart';
part 'widgets/quanhuyen_widget.dart';

class StoresScreen extends StatefulWidget with UiMixins {
  StoresScreen({super.key});

  static const String nameRoute = 'stores';
  static const String pathRoute = '/stores';

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  final ScrollController _scrollController = ScrollController();
  Color? textColorTitle = Colors.white;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.offset > 310) {
          setState(() {
            textColorTitle = Colors.black;
          });
        } else {
          setState(() {
            textColorTitle = Colors.white;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          title: Row(
            children: [
              Image.asset(
                '${MediaAssets.images}/logo.png',
                height: 35,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Hệ thống chi nhánh',
                style: TextStyle(color: textColorTitle),
              ),
            ],
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              '${MediaAssets.images}/img_store.jpg',
              fit: BoxFit.cover,
            ),
            title: LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedOpacity(
                  opacity: (constraints.maxHeight > 310) ? 1 : 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 0),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'HỆ THỐNG CỦA DIGITAL',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tính đến hiện tại, chuỗi hệ thống Digital có 20 chi nhánh tại những vị trí đắc địa nhất Tp. Hồ Chí Minh và các tỉnh lân cận. Hãy tìm kiếm đến chi nhanh gần bạn để trải nghiệm chúng tôi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 2.2,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            expandedTitleScale: 1,
            centerTitle: true,
          ),
          expandedHeight: 340,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton.icon(
                        onPressed: () {},
                        label: Text('Tìm kiếm gần bạn'),
                        icon: icons.SendDiagonal(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _TinhThanhWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    _QuanHuyenWidget(),
                  ],
                ),
              ),
              const Divider(color: Color(0xfff2f2f2)),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Image.asset(
                                  '${MediaAssets.images}/img_news.jpg',
                                  width: 70,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                    '758 Âu Cơ, Phường 14, Q. Tân Bình Tp. Hồ Chí Minh'),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              _buttonContact(
                                onTap: () {
                                  Helper.callPhone(number: '0909123123');
                                },
                                icon: Icon(
                                  Icons.phone,
                                  size: 22,
                                ),
                                text: Text(
                                  'Hotline',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              _buttonContact(
                                onTap: () async {
                                  await Helper.openMap(
                                      latitude: 10.845579,
                                      longitude: 106.638318,
                                      title: 'Dienthoaigiakho.vn');
                                },
                                icon: icons.SendDiagonalSolid(
                                  width: 20,
                                ),
                                text: Text('Chỉ đường',
                                    style: TextStyle(fontSize: 12)),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(color: Color(0xfff2f2f2)),
                  itemCount: 5,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buttonContact(
      {required Function() onTap, required Widget icon, required Widget text}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: 35,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              text,
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
