// Flutter dependencies
import "dart:ui";
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";
import "package:get/get.dart";

// Project dependencies
import "package:zequas/tabs/splash_screen.dart";
import "package:zequas/utils/globals.dart";

void main() {

  // Setting the global theme of XContainers
  xTheme.set(
    padding: const EdgeInsets.all(20),
    borderRadius: XLayout.brcS,
    primaryColor: DefaultColors.primary,
    cardColor: DefaultColors.boxWhite,
  );

  runApp(GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    // THEME ===================================================================
    themeMode: ThemeMode.light,
    theme: ThemeData.light().copyWith(
      // COLORS ----------------------------------------------------------------
      // COLOR SCHEME
      colorScheme: const ColorScheme.light().copyWith(
        secondary: DefaultColors.secondary,
        primary: DefaultColors.primary,
        background: DefaultColors.background,
      ),
      // APPBAR
      appBarTheme: const AppBarTheme().copyWith(
        color: DefaultColors.secondary,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFeatures: [FontFeature.enable("smcp")],
          letterSpacing: 0.25,
        ),
      ),
      dialogBackgroundColor: DefaultColors.secondary,
      primaryColor: DefaultColors.primary,
      backgroundColor: DefaultColors.background,
      scaffoldBackgroundColor: DefaultColors.background,
      splashColor: DefaultColors.secondary,
      iconTheme: const IconThemeData().copyWith(
        color: Colors.white,
      ),
      checkboxTheme: const CheckboxThemeData().copyWith(
        fillColor: MaterialStateProperty.all(DefaultColors.secondary),
      ),
      // TEXT ------------------------------------------------------------------
      textTheme: const TextTheme().copyWith(
        // TITLE MEDIUM
        titleMedium: const TextStyle().copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        // TITLE SMALL
        titleSmall: const TextStyle().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        // BODY MEDIUM
        bodyMedium: const TextStyle().copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        // BODY SMALL
        bodySmall: const TextStyle().copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
      ),
    ),
  ));
}
