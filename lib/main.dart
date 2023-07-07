import "package:flutter/material.dart";
import "package:get_storage/get_storage.dart";
import "package:x_containers/x_containers.dart";
import "package:get/get.dart";

import "tabs/splash_screen.dart";
import "utils/globals.dart";

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

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
