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
          SettingsRow(
            name: "Questions par partie:",
            actions: [
              IconButton(
                onPressed: () => settings.gameLength.value--,
                icon: const Icon(Icons.remove),
              ),
              Obx(() => Text(settings.gameLength.toString())),
              IconButton(
                onPressed: () => settings.gameLength.value++,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          // NUMBER OF POSSIBLE SOLUTIONS
          SettingsRow(
            name: "Nombre de choix:",
            actions: [
              IconButton(
                onPressed: () => settings.numberOfPossibleSolutions.value--,
                icon: const Icon(Icons.remove),
              ),
              Obx(() => Text(settings.numberOfPossibleSolutions.toString())),
              IconButton(
                onPressed: () => settings.numberOfPossibleSolutions.value++,
                icon: const Icon(Icons.add),
              ),
            ],
          ),

        ],
      ),
    );
  }

// METHODS ===================================================================

}
