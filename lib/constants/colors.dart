import 'package:flutter/material.dart';

class AppColors {
  // Raw colors
  static const Color white = Colors.white;
  static const Color whiteTranslucent = const Color(0x33ffffff);
  static const Color black = Colors.black;
  static const Color aquamarine = const Color(0xFF72d3a7);
  static const Color pelorous = const Color(0xFF15879E);
  static const Color darkGreen = const Color(0xFF187568);
  static const Color dimGrey = const Color(0xFF5e5e5e);
  static const Color shadowColor = const Color(0x66000000);
  static const Color crimsonRed = const Color(0xFFf02525);
  static const Color blue = const Color(0xFF2e5cd6);
  static const Color orange = const Color(0xFFfd9d26);
  static const Color red = const Color(0xFFf02525);
  static const Color yellow = const Color(0xFFffdf44);
  static const Color c66ffffff = const Color(0xFF66ffffff);
  static const Color cffdf44 = const Color(0xFFffdf44);
  static const Color c448aff = const Color(0xFF448aff);
  static const Color cea5946 = const Color(0xFFea5946);
  static Color backgroundColor9 = Color(0xffe3e3e3);
  static Color c72d3a7 = Color(0xff72d3a7);
  static Color textColor7 = Color(0xff757575);
  static const Color blackTranslucent = const Color(0xBF000000);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primary,
      primaryDark,
    ],
  );

  // Theme colors
  static const Color primary = aquamarine;
  static const Color primaryDark = pelorous;
  static const Color textDark = black;
  static const Color textSemiDark = dimGrey;
  static const Color textLight = white;
  static const Color textAlert = crimsonRed;
  static const Color iconLight = dimGrey;
}
