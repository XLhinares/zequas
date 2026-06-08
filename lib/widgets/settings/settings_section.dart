import "package:expandable/expandable.dart";
import "package:flutter/material.dart";
import "package:x_containers/x_containers.dart";

import "../../utils/extensions.dart";

/// A tile to uniformize the look of the settings.
class SettingsSection extends StatelessWidget {
  // VARIABLES =================================================================

  /// The title of the settings category.
  final String title;

  /// All the actual setting widgets going in that category.
  final Widget content;

  final ExpandableController _controller;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsSection] matching the given parameters.
  SettingsSection({
    super.key,
    required this.title,
    required this.content,
    bool startExpanded = true,
  }) : _controller = ExpandableController(initialExpanded: startExpanded);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: _controller,
      header: Padding(
        padding: EdgeInsets.only(left: XLayout.paddingS),
        child: Text(title, style: context.titleMediumOnSurface),
      ),
      collapsed: Divider(
        indent: XLayout.paddingL,
        endIndent: XLayout.paddingL,
        color: context.colors.onPrimary.withAlpha(100),
      ),
      expanded: content,
      theme: ExpandableThemeData(
        iconPlacement: ExpandablePanelIconPlacement.right,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        iconColor: context.colors.onSurface,
        inkWellBorderRadius: XLayout.brcS,
      ),
    );
  }
}
