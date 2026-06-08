import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../classes/dataclasses/background_data.dart";
import "pref_background_preview.dart";

/// A setting widget allowing to manage the theme of the app.
class SettingsBackground extends StatelessWidget {
  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsBackground] matching the given parameters.
  const SettingsBackground({super.key});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XListTile(
      margin: EdgeInsets.zero,
      internalVerticalPadding: XLayout.paddingM,
      title: Text("settings_background_selection".tr),
      content: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: XLayout.paddingL * 2.5,
            mainAxisSpacing: XLayout.paddingS,
            crossAxisSpacing: XLayout.paddingS,
            childAspectRatio: 1),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: BackgroundData.values.length,
        itemBuilder: (_, index) {
          return BackgroundPreview(BackgroundData.values[index]);
        },
      ),
    );
  }

// METHODS ===================================================================
}
