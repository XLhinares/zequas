// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

// Project dependencies
import "package:zequas/utils/globals.dart";
import "package:zequas/widgets/layout/scaffold_fit.dart";
import "package:zequas/widgets/settings/panel.dart";
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
      padding: EdgeInsets.symmetric(horizontal: XLayout.paddingM),
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: XLayout.paddingM),
        children: [
          // GAME LENGTH -------------------------------------------------------

          SettingsPanel(
            title: "Paramètres de jeu",
            description: "Les paramètres affectant la manière dont une partie se déroule.",
            settings: [
              SettingsRow.separated(
                name: "Nombre de questions:",
                // description: "Le nombre de questions qui seront posées au cours d'une partie.",
                actions: [
                  GestureDetector(
                    onTap: () => settings.gameLength.value--,
                    child: Icon(Icons.remove, color: DefaultColors.textBlack,),
                  ),
                  Obx(() => Text(settings.gameLength.toString())),
                  GestureDetector(
                    onTap: () => settings.gameLength.value++,
                    child: Icon(Icons.add, color: DefaultColors.textBlack,),
                  ),
                ],
              ),
              // NUMBER OF POSSIBLE SOLUTIONS
              SettingsRow.separated(
                name: "Nombre de choix:",
                // description: "Le nombres de potentielles solutions proposées à chaque tour.",
                actions: [
                  GestureDetector(
                    onTap: () => settings.numberOfPossibleSolutions.value--,
                    child: Icon(Icons.remove, color: DefaultColors.textBlack,),
                  ),
                  SizedBox(
                    width: XLayout.paddingM,
                    child: Center(
                      child: Obx(() => Text(settings.numberOfPossibleSolutions.toString())),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => settings.numberOfPossibleSolutions.value++,
                    child: Icon(Icons.add, color: DefaultColors.textBlack,),
                  ),
                ],
              ),
              SettingsRow(
                name: "Emojiser les questions:",
                description: "Montrer un emoji plutôt que 'x' dans les questions.",
                actions: [
                  Obx(() => Checkbox(
                    value: settings.emojifyQuestions.value,
                    onChanged: (value) => settings.emojifyQuestions.value = value ?? false,
                  ),),
                ],
              )
            ],
          )



        ],
      ),
    );
  }

// METHODS ===================================================================

}
