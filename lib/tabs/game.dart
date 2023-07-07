import "dart:async";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "game_summary.dart";
import "../utils/globals.dart";
import "../widgets/game/answer_tile.dart";
import "../widgets/layout/custom_dialog.dart";
import "../widgets/layout/frame_fit.dart";
import "../widgets/layout/scaffold_fit.dart";

/// The game tab.
///
/// It displays a game turn and allows the user to pick an answer.
/// If the answer is the solution the game goes to the next turn.
class TabGame extends StatelessWidget {

  // VARIABLES =================================================================

  /// The color of the answer box.
  ///
  /// These change when a box is tapped or the game goes to the next turn.
  late final RxList<Color?> answerColors = RxList([]);

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [Game] matching the given parameters.
  TabGame({Key? key}) : super(key: key) {
    for (int i = 0 ; i < game.possibleSolutions.length ; i++) {
      answerColors.add(null);
    }
  }

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {


    return ScaffoldFit(
      body: Stack(
        children: [
          // GAME --------------------------------------------------------------
          Positioned.fill(
            child: GetBuilder(
              init: game,
              builder: (_) => Column(
                children: [
                  Expanded(
                    // FrameFit does not appear earlier in the tree so that the
                    // progress bar can fill the whole width.
                    child: FrameFit(
                      padding: EdgeInsets.symmetric(
                        horizontal: XLayout.paddingM,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            game.question,
                            style: context.textTheme.titleMedium,
                          ),
                          XLayout.verticalM,
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: game.possibleSolutions.length,
                            itemBuilder: (context, index) => Obx(() => AnswerTile(
                                text: game.possibleSolutions[index],
                                color: answerColors[index],
                                onTap: () => submitAnswer(index)
                            ),
                            ),
                            separatorBuilder: (context, index) => XLayout.verticalM,
                          ),
                        ],
                      ),
                    ),
                  ),
                  _progressBar,
                ],
              ),
            ),
          ),
          // STOP BUTTON -------------------------------------------------------
          Positioned.fill(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: XLayout.paddingL,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        backgroundBlur: 1.5,
                        title: "Quitter",
                        message: "Êtes-vous sûr de vouloir arrêter cette session?",
                        validateText: "Oui",
                        cancelText: "Non",
                        onValidate: () {
                          game.goToEnd();
                          Get.off(() => GameSummary());
                        },
                      ),
                    ),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ),
        ],
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
    game.goToNextTurn();
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
