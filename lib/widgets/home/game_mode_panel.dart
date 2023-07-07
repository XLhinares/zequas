import "package:flutter/material.dart";
import "package:expandable/expandable.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../classes/gamemode.dart";
import "../../utils/globals.dart";

/// A panel to encompass a few gamemodes.
class GamemodePanel extends StatelessWidget {

  // CONSTRUCTOR ===============================================================

  /// The title of the panel, summarizes the contents.
  final String title;

  /// The description of the contents of the panel.
  final String description;

  /// A list of the gamemodes featured in the panel.
  final List<Gamemode> displayedModes;

  final ExpandableController _controller = ExpandableController(initialExpanded: true);

  /// Returns an instance of [GamemodePanel] matching the given parameters.
  GamemodePanel({
    Key? key,
    required this.title,
    this.description = "",
    this.displayedModes = const [],
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XContainer(
      child: ExpandablePanel(
        controller: _controller,
        header: Padding(
          padding: EdgeInsets.only(bottom: XLayout.paddingM),
          child: Text(
            title,
            style: context.textTheme.titleSmall,
          ),
        ),
        collapsed: Visibility(
          visible: description.isNotEmpty,
          child: Text(
            description,
            style: context.textTheme.bodyMedium,
          ),
        ),
        expanded: Column(
          children: [
            ...displayedModes.map<Widget>(
                  (mode) => XInkContainer(
                margin: EdgeInsets.all(XLayout.paddingXS,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: XLayout.paddingS,
                  horizontal: XLayout.paddingM,
                ),
                enableShadow: false,
                color: Colors.white70,
                alignment: Alignment.centerLeft,
                onTap: () => game.start(mode: mode),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mode.name,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      mode.example,
                      style: context.textTheme.bodySmall!.copyWith(
                        // color: Colors.black.withOpacity(0.8),
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// METHODS ===================================================================

}
