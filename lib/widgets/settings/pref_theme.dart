import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../utils/globals.dart";
import "pref_theme_preview.dart";

/// A setting widget allowing to manage the theme of the app.
class SettingsTheme extends StatelessWidget {
  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsTheme] matching the given parameters.
  const SettingsTheme({super.key});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XListTile(
      margin: EdgeInsets.zero,
      internalVerticalPadding: XLayout.paddingM,
      title: Text("settings_theme_selection".tr),
      content: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: XLayout.paddingL * 2.5,
            mainAxisSpacing: XLayout.paddingS,
            crossAxisSpacing: XLayout.paddingS,
            childAspectRatio: 1),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: app.themes.handledThemes.length,
        itemBuilder: (_, index) {
          final String name = app.themes.handledThemes[index];
          final ThemeData data = app.themes.all[name]!;
          return ThemePreview(name: name, data: data);
        },
      ),
    );
  }

// METHODS ===================================================================
}
