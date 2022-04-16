// Flutter dependencies
import 'dart:ui';

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
    primaryColor: cPrimary,
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
        secondary: cSecondary,
        primary: cPrimary,
        background: cBackground,
      ),
      // APPBAR
      appBarTheme: const AppBarTheme().copyWith(
        color: cSecondary,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFeatures: [FontFeature.enable("smcp")],
          letterSpacing: 0.25,
        ),
      ),
      dialogBackgroundColor: cSecondary,
      primaryColor: cPrimary,
      backgroundColor: cBackground,
      scaffoldBackgroundColor: cBackground,
      splashColor: cSecondary,
      iconTheme: const IconThemeData().copyWith(
        color: Colors.white,
      ),
      // TEXT ------------------------------------------------------------------
      textTheme: const TextTheme().copyWith(
        // TITLE MEDIUM
        titleMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        // TITLE SMALL
        titleSmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        // BODY MEDIUM
        bodyMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        // BODY SMALL
        bodySmall: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
      ),
    ),
  ));
}
