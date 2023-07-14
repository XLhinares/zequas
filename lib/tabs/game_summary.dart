import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../utils/globals.dart";
import "../widgets/game/game_stats.dart";
import "../widgets/game/history_tile.dart";
import "../widgets/layout/scaffold_fit.dart";
import "../classes/game/archived_turn.dart";

/// The summary of the game that was just played.
class GameSummary extends StatelessWidget {

  // VARIABLES =================================================================

  /// The history of the last game.
  late final List<ArchivedTurn> history;

  /// The score obtained during the last game.
  late final int score;

  /// The percentage of success obtained during the last game.
  late final int success;


  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [GameSummary] matching the given parameters.
  GameSummary({Key? key}) : super(key: key) {
    history = game.history;

    int points = 0;
    int score = 0;

    for (final ArchivedTurn turn in history) {
      points += turn.points;
      score += turn.score;

      print("Turn lasted ${turn.duration}ms");
      print("It earned ${turn.points} points and ${turn.score} score");
    }

    success = (100 * points / (history.length * 5)).round();
    this.score = score;
  }

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ScaffoldFit(
      body: Stack(
        children: [

          // MAIN WINDOW -------------------------------------------------------
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: XLayout.paddingM),
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: Get.height * 0.1,
                  bottom: Get.height * 0.15,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: history.length + 1,
                itemBuilder: (context, index) => index == 0
                    ? GameStats(score: score, success: success,)
                    : HistoryTile(
                  question: history[index - 1].question,
                  solution: history[index - 1].solution,
                  tries: history[index - 1].attempts,
                ),
                separatorBuilder: (context, index) => XLayout.verticalS,
              ),
            ),
          ),

          // FOREGROUND BUTTON -------------------------------------------------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: XInkContainer(
              margin: EdgeInsets.all(XLayout.paddingM),
              onTap: () => Get.back(),
              child: Text(
                "back_to_menu".tr,
                style: Get.textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
    );
  }

// METHODS ===================================================================

}
