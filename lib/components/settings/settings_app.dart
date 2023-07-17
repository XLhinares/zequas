import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../widgets/settings/settings.dart";

/// A panel where the user can control the app settings.
class SettingsApp extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsApp] matching the given parameters.
  const SettingsApp({super.key,});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SettingsPanel(
      title: "settings_app".tr,
      description: "settings_app_desc".tr,
      settings: [
        SettingsRow(
          name: "settings_app_locale".tr,
          description: "settings_app_locale_desc".tr,
          actions: [SettingsLocale()],
        ),
      ],
    );
  }

// METHODS ===================================================================

}
