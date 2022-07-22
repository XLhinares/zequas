// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

// Project dependencies
import "package:zequas/utils/globals.dart";

/// A row used to display settings in a uniformized way.
class SettingsRow extends StatelessWidget {

  // VARIABLES =================================================================

  /// The name of the settings.
  final String name;

  /// A description of what the setting does.
  final String description;

  /// A list
  final List<Widget> actions;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsRow] matching the given parameters.
  const SettingsRow({
    Key? key,
    required this.name,
    this.description = "",
    this.actions = const <Widget>[],
  }) : super(key: key);

  /// Returns an instance of [SettingsRow] where all the actions are separated by a given separator.
  factory SettingsRow.separated({
    Key? key,
    required String name,
    String description = "",
    List<Widget> actions = const <Widget>[],
    Widget? separator,
  }) {
    final List<Widget> separatedActions = [];
    for (var item in actions) {
      separatedActions.add(item);
      separatedActions.add(separator ?? XLayout.horizontalS);
    }
    separatedActions.removeLast();

    return SettingsRow(
      key: key,
      name: name,
      description: description,
      actions: separatedActions,
    );
  }
  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XCard(
      margin: EdgeInsets.symmetric(vertical: XLayout.paddingXS),
      padding: EdgeInsets.all(XLayout.paddingS),
      enableShadow: false,
      // density: XLayout.paddingM,
      title: Text(
        name,
        style: Get.textTheme.bodyMedium!.copyWith(
            color: DefaultColors.textBlack
        ),
      ),
      subtitle: description.isEmpty
          ? null
          : Text(
        description,
        style: Get.textTheme.bodySmall!.copyWith(
            color: DefaultColors.textBlack
        ),
      ),
      trailing: DefaultTextStyle(
        style: Get.textTheme.bodyMedium!.copyWith(
          color: DefaultColors.textBlack,
        ),
          child: Row(children: actions)
      ),
    );
  }

// METHODS ===================================================================

}
