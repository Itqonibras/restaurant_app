import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/app_theme.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';
import 'package:restaurant_app/page/detail_page.dart';
import 'package:restaurant_app/page/favorite_page.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/page/page_manager.dart';
import 'package:restaurant_app/page/settings_page.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/peferences_provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/provider/schedulling_provider.dart';
import 'package:restaurant_app/utils/background_service.dart';
import 'package:restaurant_app/utils/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotification(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
            create: (_) => PreferencesProvider(
                preferencesHelper: PreferencesHelper(
                    sharedPreferences: SharedPreferences.getInstance()))),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: myAppTheme,
        initialRoute: PageManager.routeName,
        routes: {
          PageManager.routeName: (context) => const PageManager(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          FavPage.routeName: (context) => const FavPage(),
          HomePage.routeName: (context) => const HomePage(),
          DetailPage.routeName: (context) => DetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant),
        },
      ),
    );
  }
}
