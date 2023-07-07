import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

/// A container displaying the stats of the player during the last game
class GameStats extends StatelessWidget {

  // VARIABLES =================================================================

  /// The score achieved by the user.
  final int score;

  /// The success rate during the game.
  final int success;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [GameStats] matching the given parameters.
  const GameStats({
    Key? key,
    required this.score,
    required this.success,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taux de réussite:",
                style: context.textTheme.titleMedium,
              ),
              Text(
                "$success %",
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          XLayout.verticalXS,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Score:",
                style: context.textTheme.titleSmall,
              ),
              Text(
                score.toString(),
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

// METHODS ===================================================================

}
