import "package:flutter/material.dart";
import "package:expandable/expandable.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../classes/game/game_category.dart";
import "../../utils/globals.dart";

/// A panel to encompass a few gamemodes.
class GameCategoryPanel extends StatelessWidget {

  // CONSTRUCTOR ===============================================================

  /// The [GameCategory] to be displayed in this panel.
  final GameCategory category;

  final ExpandableController _controller = ExpandableController(initialExpanded: true);

  /// Returns an instance of [GameCategoryPanel] matching the given parameters.
  GameCategoryPanel({
    Key? key,
    required this.category,
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
            category.title.tr,
            style: context.textTheme.titleSmall,
          ),
        ),
        collapsed: Visibility(
          visible: category.description.isNotEmpty,
          child: Text(
            category.description.tr,
            style: context.textTheme.bodyMedium,
          ),
        ),
        expanded: Column(
          children: [
            ...category.modes.map<Widget>(
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
                      mode.title.tr,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      mode.description.tr,
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
