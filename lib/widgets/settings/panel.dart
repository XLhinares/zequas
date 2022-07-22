// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:expandable/expandable.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

// Project dependencies
import "package:zequas/widgets/settings/settings_row.dart";

/// A panel widget grouping some settings by category.
class SettingsPanel extends StatelessWidget {

  // VARIABLES =================================================================

  /// The title of the panel, summarizes the contents.
  final String title;

  /// The description of the contents of the panel.
  final String description;

  /// A list of the gamemodes featured in the panel.
  final List<SettingsRow> settings;

  final ExpandableController _controller = ExpandableController(initialExpanded: true);

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsPanel] matching the given parameters.
  SettingsPanel({
    Key? key,
    required this.title,
    this.description = "",
    this.settings = const [],
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: ExpandablePanel(
        controller: _controller,
        header: Padding(
          padding: EdgeInsets.only(bottom: XLayout.paddingM),
          child: Text(
            title,
            style: Get.textTheme.titleSmall,
          ),
        ),
        collapsed: Visibility(
          visible: description.isNotEmpty,
          child: Text(
            description,
            style: Get.textTheme.bodyMedium,
          ),
        ),
        expanded: Column(
          children: settings,
        ),
      ),
    );
  }

  // METHODS ===================================================================

}
