// Flutter dependencies
import "package:flutter/material.dart";

/// A row used to display settings in a uniformized way.
class SettingsRow extends StatelessWidget {

  // VARIABLES =================================================================

  /// The name of the settings.
  final String name;

  /// A list
  final List<Widget> actions;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsRow] matching the given parameters.
  const SettingsRow({
    Key? key,
    required this.name,
    this.actions = const <Widget>[],
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name),
        const Expanded(child: SizedBox()),
        ...actions,
      ],
    );
  }

  // METHODS ===================================================================

}
