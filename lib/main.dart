import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/app_theme.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:flutter/services.dart';

void main () => runApp(const MyApp());

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
        ChangeNotifierProvider(create: (_) => RestaurantProvider(apiService: ApiService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myAppTheme,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
