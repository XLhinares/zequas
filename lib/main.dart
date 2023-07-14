import "package:flutter/material.dart";
import "package:get_storage/get_storage.dart";
import "package:x_containers/x_containers.dart";
import "package:get/get.dart";

import "tabs/splash_screen.dart";
import "utils/utils.dart";

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Setting the global theme of XContainers
  xTheme.set(
    padding: EdgeInsets.all(XLayout.paddingM),
    borderRadius: XLayout.brcS,
  );

  postInitialize();
  print(translations.keys["en"]?.keys);

  runApp(GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    translations: translations,
    locale: Get.deviceLocale,
    fallbackLocale: const Locale("en"),
    // THEME ===================================================================
    themeMode: ThemeMode.light,
    theme: themePastel,
  ));
}
