import "dart:async";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "home.dart";
import "../utils/globals.dart";
import "../widgets/layout/scaffold_fit.dart";

/// The screen at the beginning of the app that loads the required components.
///
/// At the end of the splash screen, all the critical initialization tasks can
/// be assumed to be completed.
class SplashScreen extends StatelessWidget {

  // VARIABLES =================================================================

  /// The opacity of the contents.
  final RxDouble opacity = RxDouble(1);

  /// The time it takes for the contents to disappear at the end of the loading.
  final Duration fadeOutTime = const Duration(milliseconds: 200);

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SplashScreen] matching the given parameters.
  SplashScreen({Key? key}) : super(key: key) {
    // Start checking if the requirement are loaded as soon as possible.
    Timer.run(checkIfLoaded);
  }

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ScaffoldFit(
      body: Center(
        child: Obx(() =>
          AnimatedOpacity(
            opacity: opacity.value,
            duration: fadeOutTime,
            child: XContainer(
              margin: EdgeInsets.all(XLayout.paddingM),
              height: Get.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Préparation de l'appli.",
                    style: context.textTheme.bodyMedium,
                  ),
                  XLayout.verticalM,
                  CircularProgressIndicator(
                    color: context.theme.colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // METHODS ===================================================================

  /// Check whether the requirements to go to the next screen are loaded.
  ///
  /// If they are not, a new check is scheduled after 50ms.
  void checkIfLoaded () {
    if (
    settings.loaded.value
    ) {
      opacity.value = 0;
      Timer(fadeOutTime, () => Get.off(() => const Home()));
    } else {
      Timer(const Duration(milliseconds: 50), checkIfLoaded);
    }
  }

}
