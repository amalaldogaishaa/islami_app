import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0XFFE2BE7F);
  static const Color black = Color(0XFF202020);
  static const Color white = Color(0XFFFFFFFF);

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
  );
}
