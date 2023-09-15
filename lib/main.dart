import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/app_theme.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/page/detail_page.dart';
import 'package:restaurant_app/page/favorite_page.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/page/page_manager.dart';
import 'package:restaurant_app/page/settings_page.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myAppTheme,
        initialRoute: PageManager.routeName,
        // initialRoute: HomePage.routeName,
        routes: {
          PageManager.routeName: (context) => const PageManager(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          FavPage.routeName: (context) => const FavPage(),
          HomePage.routeName: (context) => const HomePage(),
          DetailPage.routeName: (context) => DetailPage(
              id: ModalRoute.of(context)?.settings.arguments as String),
        },
      ),
    );
  }
}
