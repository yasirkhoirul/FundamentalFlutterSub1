import 'package:flutter/material.dart';

class Themeapps {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.light,
      fontFamily: "Poppins",
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: "Poppins",
    );
  }
}
