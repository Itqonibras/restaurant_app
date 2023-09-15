import 'package:flutter/material.dart';
import 'package:restaurant_app/common/type_theme.dart';

const Color primaryColor = Color(0xFFF4F4F4);
Color secondaryColor = Colors.blue;

final myAppTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.black,
    centerTitle: true,
    elevation: 0
  ),

  textTheme: myTextTheme,

  scaffoldBackgroundColor: primaryColor,

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: secondaryColor,
        width: 2,
      ),
    ),
    hoverColor: Colors.black.withOpacity(0.075),
    fillColor: const Color(0xFFFFFFFF),
    filled: true,
    isDense: true,
  ),
);
