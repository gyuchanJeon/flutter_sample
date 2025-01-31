import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
    centerTitle: true,
    backgroundColor: Colors.black12,
    elevation: 0,
    scrolledUnderElevation: 0,
  );
}
