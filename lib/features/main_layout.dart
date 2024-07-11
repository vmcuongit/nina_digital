import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../shared/constants/media_assets.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  BottomNavigationBarItem _itemNav(BuildContext context,
      {required String label, required String icon}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: SvgPicture.asset(
          icon,
          height: 20,
          color: const Color(0xff797979),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: SvgPicture.asset(
          icon,
          height: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xfff2f2f2),
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            items: [
              _itemNav(context,
                  label: 'Trang chủ', icon: '${MediaAssets.icons}/home.svg'),
              _itemNav(context,
                  label: 'Yêu thích', icon: '${MediaAssets.icons}/fav.svg'),
              _itemNav(context,
                  label: 'Danh mục', icon: '${MediaAssets.icons}/category.svg'),
              _itemNav(context,
                  label: 'Tin tức', icon: '${MediaAssets.icons}/news.svg'),
              _itemNav(context,
                  label: 'Tài khoản', icon: '${MediaAssets.icons}/profile.svg'),
            ],
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xff797979),
            fixedColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.white,
            currentIndex: navigationShell.currentIndex,
            showUnselectedLabels: true,
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, fontFamily: 'UTM-Caviar'),
            selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontFamily: 'UTM-Caviar',
                fontWeight: FontWeight.bold),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
