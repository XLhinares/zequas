// Flutter dependencies
import "package:flutter/material.dart";
import "package:get/get.dart";

// Package dependencies
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
    return ShadowContainer(
      margin: EdgeInsets.all(xPaddingS),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taux de réussite:",
                style: Get.textTheme.titleMedium,
              ),
              Text(
                "$success %",
                style: Get.textTheme.titleMedium,
              ),
            ],
          ),
          XLayout.verticalXS,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Score:",
                style: Get.textTheme.titleSmall,
              ),
              Text(
                score.toString(),
                style: Get.textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

// METHODS ===================================================================

}
