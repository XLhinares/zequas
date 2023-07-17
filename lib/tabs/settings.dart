import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../components/settings/settings.dart";
import "../widgets/layout/scaffold_fit.dart";

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
      body: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: XLayout.paddingM),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => XLayout.verticalM,
      ),
    );
  }

  // METHODS ===================================================================

  /// The different settings categories to display.
  List<Widget> get children => const [
    SettingsGame(),
    SettingsApp(),
    SettingsCredits(),
  ];

}
