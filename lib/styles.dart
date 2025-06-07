import 'package:flutter/material.dart';

class Styles {
  static const Color primaryColor = Color(0xFF052A43);
  static const Color secondaryColor = Color(0xFF0D6AA9);
  static const Color lightGrey = Color(0xFFD0D0D0);

  static const LinearGradient scaffoldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF052A43),
      Color(0xFF0D6AA9),
    ],
  );

  static MaterialColor get primaryMaterialColor {
    const Color color = primaryColor;
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;
    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
