import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../utils/globals.dart";
import "../utils/tools.dart";
import "../widgets/layout/scaffold_fit.dart";
import "../widgets/settings/locale.dart";
import "../widgets/settings/panel.dart";
import "../widgets/settings/settings_row.dart";

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
        title: Text("settings".tr),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: XLayout.paddingM),
        children: [
          // GAME LENGTH -------------------------------------------------------

          SettingsPanel(
            title: "settings_game".tr,
            description: "settings_game_desc".tr,
            settings: [
              SettingsRow.separated(
                name: "settings_game_questions".tr,
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
                name: "settings_game_choices".tr,
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
                name: "settings_game_emojis".tr,
                description: "settings_game_emojis_desc".tr,
                actions: [
                  Obx(() => Checkbox(
                    value: settings.emojifyQuestions.value,
                    onChanged: (value) => settings.emojifyQuestions.value = value ?? false,
                  ),),
                ],
              )
            ],
          ),

          XLayout.verticalM,

          SettingsPanel(
            title: "settings_app".tr,
            description: "settings_app_desc".tr,
            settings: [
              SettingsRow(
                name: "settings_app_locale".tr,
                actions: [SettingsLocale()],
              ),
            ],
          ),

        ],
      ),
    );
  }

// METHODS ===================================================================

}
