// Flutter dependencies
import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:x_containers/x_containers.dart";

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

  /// Returns an instance of [SettingsRow] where all the actions are separated by a given separator.
  factory SettingsRow.separated({
    Key? key,
    required String name,
    List<Widget> actions = const <Widget>[],
    required Widget separator,
  }) {
    final List<Widget> separatedActions = [];
    for (var item in actions) {
      separatedActions.add(item);
      separatedActions.add(separator);
    }
    separatedActions.removeLast();

    return SettingsRow(key: key, name: name, actions: separatedActions);
  }
  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      height: xPaddingL,
      padding: EdgeInsets.all(xPaddingS),
      child: DefaultTextStyle(
        style: Get.textTheme.bodyMedium!,
        child: Row(
          children: [
            Text(name,),
            const Expanded(child: SizedBox()),
            ...actions,
          ],
        ),
      ),
    );
  }

// METHODS ===================================================================

}
