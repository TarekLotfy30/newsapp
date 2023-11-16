import 'package:flutter/material.dart';

class LightMode {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.cyan,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.cyan,
      selectedLabelStyle: TextStyle(),
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      unselectedItemColor: Colors.blueGrey,
      unselectedLabelStyle: TextStyle(),
      unselectedIconTheme: IconThemeData(
        size: 20,
      ),
    ),
  );
}
