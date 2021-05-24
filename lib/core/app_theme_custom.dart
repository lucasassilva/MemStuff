import 'package:flutter/material.dart';
ThemeData theme() {
  return ThemeData(
    accentColor: Colors.indigo,
    primarySwatch: Colors.indigo,
    backgroundColor: Colors.white,
    //brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xfff4f4f4),
    //fontFamily: 'Quicksand',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigo,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary:  Colors.green, // background color
      ),
    ),
  );
}