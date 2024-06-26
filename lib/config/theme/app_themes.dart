import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      elevation: 0.0,
      color: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xff8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0xff8B8B8B), fontSize: 18));
}
