import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../widgets/settings/settings.dart";

/// A panel where the user can see the app credits.
class SettingsCredits extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsCredits] matching the given parameters.
  const SettingsCredits({super.key,});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SettingsPanel(
      title: "settings_credits".tr,
      description: "settings_credits_desc".tr,
      settings: [
        SettingsCreditsSite(),
        SettingsCreditsBMAC(),
        // const SettingsCreditsAd(),
      ],
    );
  }

// METHODS ===================================================================

}
