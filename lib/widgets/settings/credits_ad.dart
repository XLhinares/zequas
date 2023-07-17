import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "settings.dart";

/// A [SettingsRow] to let the user watch an ad for me if they want.
class SettingsCreditsAd extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsCreditsAd] matching the given parameters.
  const SettingsCreditsAd({super.key,});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SettingsRow(
      name: "settings_credits_ad".tr,
      description: "settings_credits_ad_desc".tr,
      actions: [
        XInkContainer(
          color: context.theme.colorScheme.secondary,
          padding: EdgeInsets.all(XLayout.paddingS),
          child: const Icon(Icons.video_collection,),
        ),
      ],
    );
  }

// METHODS ===================================================================

}
