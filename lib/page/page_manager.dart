import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/page/detail_page.dart';
import 'package:restaurant_app/page/favorite_page.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/page/settings_page.dart';
import 'package:restaurant_app/provider/schedulling_provider.dart';
import 'package:restaurant_app/utils/notification_helper.dart';
import '../provider/restaurant_provider.dart';

class PageManager extends StatefulWidget {
  static const routeName = 'page-manager';

  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  int _pageIndex = 0;
  final screenBody = [
    const HomePage(),
    const FavPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotification(DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenBody[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _pageIndex = index;
            text = '';
            Provider.of<RestaurantProvider>(context, listen: false)
                .setQuery('');
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        currentIndex: _pageIndex,
        backgroundColor: const Color(0xFFFFFFFF),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
