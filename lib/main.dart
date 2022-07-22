// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";
import "package:get/get.dart";

// Project dependencies
import "package:zequas/tabs/splash_screen.dart";
import "package:zequas/utils/globals.dart";

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // Setting the global theme of XContainers
  xTheme.set(
    padding: EdgeInsets.all(XLayout.paddingM),
    borderRadius: XLayout.brcS,
  );

  runApp(GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    // THEME ===================================================================
    themeMode: ThemeMode.light,
    theme: themePastel,
  ));
}
