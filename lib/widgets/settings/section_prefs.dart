import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../widgets/settings/pref_background.dart";
import "../../widgets/settings/pref_locale.dart";
import "settings_section.dart";
import "../../widgets/settings/pref_theme.dart";

/// The widget allowing the user to set their preferences.
class SettingsSectionPreferences extends StatelessWidget {
  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsSectionPreferences] matching the given parameters.
  const SettingsSectionPreferences({super.key});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: "settings_preferences".tr,
      content: Column(
        children: [
          SettingsLocale(),
          XLayout.verticalXS,
          XContainer(
            child: Column(
              children: [
                const SettingsTheme(),
                XLayout.verticalS,
                const SettingsBackground(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
