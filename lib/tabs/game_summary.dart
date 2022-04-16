// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

// Project dependencies
import "package:zequas/utils/globals.dart";
import "package:zequas/widgets/game/game_stats.dart";
import "package:zequas/widgets/game/history_tile.dart";
import "package:zequas/widgets/layout/scaffold_fit.dart";

/// The summary of the game that was just played.
class GameSummary extends StatelessWidget {

  // VARIABLES =================================================================

  /// The history of the last game.
  late final List<Map<String, String>> history;

  /// The score obtained during the last game.
  late final int score;

  /// The percentage of success obtained during the last game.
  late final int success;


  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [GameSummary] matching the given parameters.
  GameSummary({Key? key}) : super(key: key) {
    history = game.history;

    int points = 0;
    for (final Map<String, String> turn in history) {
      final int tries = int.parse(turn["tries"]!);
      if (tries <= 1) {
        // Add 5 point below 1 try.
        points += 5;
      } else if (tries <= 2) {
        // Add 3 point below 3 tries.
        points += 3;
      } else if (tries <= 4) {
        // Add 2 point below 5 tries.
        points += 2;
      } else if (tries <= 10) {
        // Add 1 point below 11 tries
        points += 1;
      } else {
        // Don't add point above 10 tries.
      }
    }

    print("points: $points");
    print("max points: ${history.length * 5}");
    success = (100 * points / (history.length * 5)).round();

    //todo: a real score function taking time into account
    score = success * 100;
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
              padding: EdgeInsets.symmetric(horizontal: xPaddingM),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: Get.height * 0.1,
                  bottom: Get.height * 0.15,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: history.length + 1,
                itemBuilder: (BuildContext context, int index) => index == 0
                    ? GameStats(score: score, success: success,)
                    : HistoryTile(
                  question: history[index - 1]["question"]!,
                  solution: history[index - 1]["solution"]!,
                  tries: history[index - 1]["tries"]!,
                ),
              ),
            ),
          ),

          // FOREGROUND BUTTON -------------------------------------------------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkContainer(
              margin: EdgeInsets.all(xPaddingM),
              onTap: () => Get.back(),
              child: Text(
                "Retour au menu",
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
