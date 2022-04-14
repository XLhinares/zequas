// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";
import "package:get/get.dart";

// Project dependencies
import "package:zequas/tabs/home.dart";
import "package:zequas/utils/globals.dart";

void main() {

  // Setting the global theme of XContainers
  xTheme.set(
    padding: const EdgeInsets.all(20),
    primaryColor: cSecondary,
  );

  runApp(GetMaterialApp(
    home: const Home(),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
      // COLOR SCHEME
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: cSecondary,
        primary: cPrimary,
      ),
      // APPBAR
      appBarTheme: const AppBarTheme().copyWith(
        color: cSecondary,
      ),
      // COLORS
      primaryColor: cPrimary,
      splashColor: cSecondary,
    ),
  ));
}
