// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";
import "package:get/get.dart";

// Project dependencies
import "package:zequas/tabs/home.dart";
import "package:zequas/utils/globals.dart";
import "package:zequas/utils/layout_globals.dart";

void main() {

  // Setting the global theme of XContainers
  xTheme.set(
    padding: const EdgeInsets.all(20),
    borderRadius: ContainerShape.brcS,
    primaryColor: cSecondary,
  );

  runApp(GetMaterialApp(
    home: const Home(),
    themeMode: ThemeMode.light,
    theme: ThemeData.light().copyWith(
      // COLORS ----------------------------------------------------------------
      // COLOR SCHEME
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: cSecondary,
        primary: cPrimary,
      ),
      // APPBAR
      appBarTheme: const AppBarTheme().copyWith(
        color: cAccent,
      ),
      primaryColor: cPrimary,
      backgroundColor: cPrimary,
      scaffoldBackgroundColor: cPrimary,
      splashColor: cSecondary,
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
