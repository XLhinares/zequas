import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../utils/globals.dart";
import "../widgets/layout/scaffold_fit.dart";
import "../widgets/settings/section_prefs.dart";
import "../widgets/settings/settings_section.dart";
import "../widgets/settings/settings_tile.dart";

/// A tab where the user can find and edit the main app settings.
class TabSettings extends StatelessWidget {
  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [TabSettings] matching the given parameters.
  const TabSettings({super.key});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ScaffoldFit(
      padding: EdgeInsets.symmetric(horizontal: XLayout.paddingM),
      title: "settings".tr,
      appbarShowBack: true,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: XLayout.paddingM),
        clipBehavior: Clip.none,
        children: [
          // GAME LENGTH -------------------------------------------------------

          SettingsSection(
            title: "settings_game".tr,
            // description: "settings_game_desc".tr,
            content: Column(
              children: [
                Obx(() => SettingsTile.rotator(
                      title: "settings_game_questions".trParams(
                          {"value": app.cookies.gameLength.rx.toString()}),
                      description: "settings_game_questions_desc".tr,
                      onTapLeft: () => app.cookies.gameLength.value--,
                      onTapRight: () => app.cookies.gameLength.value++,
                    )),
                XLayout.verticalXS,
                // NUMBER OF POSSIBLE SOLUTIONS
                Obx(() => SettingsTile.rotator(
                      title: "settings_game_choices".trParams({
                        "value":
                            app.cookies.numberOfPossibleSolutions.rx.toString()
                      }),
                      description: "settings_game_choices_desc".tr,
                      onTapLeft: () =>
                          app.cookies.numberOfPossibleSolutions.value--,
                      onTapRight: () =>
                          app.cookies.numberOfPossibleSolutions.value++,
                    )),
                XLayout.verticalXS,
                SettingsTile.toggle(
                  title: "settings_game_emojis".tr,
                  description: "settings_game_emojis_desc".tr,
                  observed: app.cookies.emojifyQuestions.value,
                  onTap: (value) => app.cookies.emojifyQuestions.value = value,
                )
              ],
            ),
          ),

          XLayout.verticalM,

          SettingsSectionPreferences(),
        ],
      ),
    );
  }

// METHODS ===================================================================
}
