import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:go_router/go_router.dart';

import '../shared/constants/media_assets.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  final List<BottomNavigationBarItem> _pageNav = [
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Icon(Icons.home),
      ),
      label: 'Trang chủ',
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: icons.FavouriteBook(),
      ),
      label: 'Yêu thích',
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: icons.Cell2x2(),
      ),
      label: 'Danh mục',
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: icons.Page(),
      ),
      label: 'Tin tức',
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: icons.User(),
      ),
      label: 'Tài khoản',
    ),
  ];

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
          padding: const EdgeInsets.only(top: 5),
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
            items: List<BottomNavigationBarItem>.generate(_pageNav.length,
                (int index) {
              return _pageNav[index];
            }),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xff797979),
            fixedColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.white,
            currentIndex: navigationShell.currentIndex,
            iconSize: 22,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
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
