// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

// Project dependencies
import "package:zequas/utils/globals.dart";
import "package:zequas/widgets/layout/scaffold_fit.dart";
import "package:zequas/widgets/settings/settings_row.dart";

/// A tab where the user can find and edit the main app settings.
class TabSettings extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [TabSettings] matching the given parameters.
  const TabSettings({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ScaffoldFit(
      padding: EdgeInsets.symmetric(horizontal: xPaddingM),
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: xPaddingM),
        children: [
          // GAME LENGTH -------------------------------------------------------

          ShadowContainer(
            color: Get.theme.colorScheme.secondary,
            child: Text("Paramètres de jeu",
            style: Get.textTheme.titleSmall,
            ),
          ),
          XLayout.verticalM,

          SettingsRow.separated(
            name: "Nombre de questions:",
            // description: "Le nombre de questions qui seront posées au cours d'une partie.",
            separator: XLayout.horizontalS,
            actions: [
              GestureDetector(
                onTap: () => settings.gameLength.value--,
                child: const Icon(Icons.remove),
              ),
              Obx(() => Text(settings.gameLength.toString())),
              GestureDetector(
                onTap: () => settings.gameLength.value++,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          // NUMBER OF POSSIBLE SOLUTIONS
          SettingsRow.separated(
            name: "Nombre de choix:",
            separator: XLayout.horizontalS,
            actions: [
              GestureDetector(
                onTap: () => settings.numberOfPossibleSolutions.value--,
                child: const Icon(Icons.remove),
              ),
              Obx(() => Text(settings.numberOfPossibleSolutions.toString())),
              GestureDetector(
                onTap: () => settings.numberOfPossibleSolutions.value++,
                child: const Icon(Icons.add),
              ),
            ],
          ),

        ],
      ),
    );
  }

// METHODS ===================================================================

}
