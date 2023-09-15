import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/page/favorite_page.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/page/settings_page.dart';

import '../provider/restaurant_provider.dart';

class PageManager extends StatefulWidget {
  static const routeName = 'page-manager';

  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  int _pageIndex = 0;
  final screenBody = [
    const HomePage(),
    const FavPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenBody[_pageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          height: 60,
          backgroundColor: Color(0xFFFFFFFF),
          indicatorColor: Color(0xFFE7E7E7),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
        child: NavigationBar(
          selectedIndex: _pageIndex,
          onDestinationSelected: (index) {
            setState(() {
              _pageIndex = index;
              text = '';
              Provider.of<RestaurantProvider>(context, listen: false)
                  .setQuery('');
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline_rounded),
              label: 'Favorite',
              selectedIcon: Icon(Icons.favorite_rounded),
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              selectedIcon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
