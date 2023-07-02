import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondary = Color(0xFF22242F);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = secondary;
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color.fromARGB(255, 172, 175, 195);
  static const iconDark = secondary;
  static const textHighlight = Color(0xFF53585A);
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
  static const textStyle = TextStyle(
      fontFamily: "FiraSans",
      fontSize: 16,
      color: secondary,
      fontWeight: FontWeight.w500);
  static const TextStyle headLineStyle1 = TextStyle(
      fontFamily: "FiraSans",
      fontSize: 30,
      color: textDark,
      fontWeight: FontWeight.bold);
  static const TextStyle headLineStyle2 = TextStyle(
      fontFamily: "FiraSans",
      fontSize: 14,
      color: secondary,
      fontWeight: FontWeight.bold);
  static const TextStyle headLineStyle3 = TextStyle(
      fontFamily: "FiraSans",
      fontSize: 22,
      color: textDark,
      fontWeight: FontWeight.bold);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFFF3F4F6);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        // brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: accentColor, brightness: Brightness.light)
            .copyWith(background: _LightColors.background),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        // brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLigth),
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: accentColor, brightness: Brightness.dark)
            .copyWith(background: _DarkColors.background),
      );
}
