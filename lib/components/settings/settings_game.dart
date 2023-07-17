import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../utils/utils.dart";
import "../../widgets/settings/settings.dart";

/// A panel where the user can control the game settings.
class SettingsGame extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsGame] matching the given parameters.
  const SettingsGame({super.key,});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return
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
              SizedBox(
                width: XLayout.paddingM,
                child: Center(
                  child: Obx(() => Text(settings.gameLength.toString())),
                ),
              ),
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
      );
  }

  // METHODS ===================================================================

}
