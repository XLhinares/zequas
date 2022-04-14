// Flutter dependencies
import "dart:async";

import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";
import "package:zequas/tabs/game_summary.dart";

// Project dependencies
import "package:zequas/utils/globals.dart";
import "package:zequas/utils/layout_globals.dart";
import "package:zequas/widgets/game/answer_tile.dart";

/// The game tab.
///
/// It displays a game turn and allows the user to pick an answer.
/// If the answer is the solution the game goes to the next turn.
class GameTab extends StatelessWidget {

  // VARIABLES =================================================================

  /// The color of the answer box.
  ///
  /// These change when a box is tapped or the game goes to the next turn.
  late final RxList<Color?> answerColors = RxList([]);

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [Game] matching the given parameters.
  GameTab({Key? key}) : super(key: key) {
    for (int i = 0 ; i < game.possibleSolutions.length ; i++) {
      answerColors.add(null);
    }
  }

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: GetBuilder(
        init: game,
        builder: (_) => Column(
          children: [
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.1
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                          game.question,
                        style: Get.theme.textTheme.titleMedium,
                      ),

                      Space.verticalM,

                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: game.possibleSolutions.length,
                        itemBuilder: (context, index) => Obx(() => AnswerTile(
                              text: game.possibleSolutions[index],
                              color: answerColors[index],
                              onTap: () => submitAnswer(index)
                          ),
                        ),
                        separatorBuilder: (context, index) => Space.verticalM,
                      ),


                    ],
                  ),
                ),
            ),
            _progressBar,
          ],
        ),
      ),
    );
  }

  // METHODS ===================================================================

  /// Reset all the answer's colors
  void resetColors () {
    for (int i = 0 ; i < answerColors.length ; i++) {
      answerColors[i] = null;
    }
  }

  /// Check whether the answer is right and color the Answer accordingly.
  void submitAnswer (int index) {

    final bool answerIsRight = game.submitAnswer(game.possibleSolutions[index]);
    resetColors();

    if (answerIsRight) {
      // Color the chosen answer green.
      answerColors[index] = Colors.green;
      Timer(const Duration(milliseconds: 500), nextQuestion);
    } else {
      answerColors[index] = Colors.red;
    }
  }

  /// Reset the colors and displays the next question.
  void nextQuestion () {
    resetColors();
    if (game.playingLastTurn) {
      Get.off(() => GameSummary());
    } else {
      game.goToNextTurn();
    }
  }

  // WIDGETS ===================================================================

  Widget get _progressBar {
    const double thickness = 5;
    return Row(
      children: [
        ColoredBox(
          color: Colors.green,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            child: SizedBox(
              height: thickness,
              width: Get.width * game.progress,
            ),
          ),
        ),
        const Expanded(
          child: ColoredBox(
            color: Colors.grey,
            child: SizedBox(
              height: thickness,
            ),
          ),
        ),
      ],
    );
  }

}
