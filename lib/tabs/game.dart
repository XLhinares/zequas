import "dart:async";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../utils/extensions.dart";
import "game_summary.dart";
import "../utils/globals.dart";
import "../widgets/game/answer_tile.dart";
import "../widgets/layout/custom_dialog.dart";
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
  TabGame({super.key}) {
    for (int i = 0; i < app.game.possibleSolutions.length; i++) {
      answerColors.add(null);
    }
  }

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ScaffoldFit(
      appbarShowBack: true,
      appbarActions: [
        IconButton(
          iconSize: XLayout.paddingL,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => CustomDialog(
              backgroundBlur: 1.5,
              title: "game_leave".tr,
              message: "game_leave_desc".tr,
              validateText: "yes".tr,
              cancelText: "no".tr,
              onValidate: () {
                app.game.goToEnd();
                Get.off(() => GameSummary());
              },
            ),
          ),
          icon: const Icon(Icons.close),
          color: context.colors.onSecondary,
        ),
      ],
      body: GetBuilder(
        init: app.game,
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              app.game.question,
              style: context.textTheme.titleMedium
                  ?.copyWith(color: context.colors.onSurface),
            ),
            XLayout.verticalM,
            ListView.separated(
              shrinkWrap: true,
              itemCount: app.game.possibleSolutions.length,
              itemBuilder: (context, index) => Obx(
                () => AnswerTile(
                    text: app.game.possibleSolutions[index].tr,
                    color: answerColors[index],
                    onTap: () => submitAnswer(index)),
              ),
              separatorBuilder: (context, index) => XLayout.verticalM,
            ),
          ],
        ),
      ),
      overlay: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: GetBuilder(
            init: app.game,
            builder: (_) => LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                  value: app.game.progress,
                  minHeight: 5,
                )),
      ),
    );
  }

  // METHODS ===================================================================

  /// Reset all the answer's colors
  void resetColors() {
    for (int i = 0; i < answerColors.length; i++) {
      answerColors[i] = null;
    }
  }

  /// Check whether the answer is right and color the Answer accordingly.
  void submitAnswer(int index) {
    final bool answerIsRight =
        app.game.submitAnswer(app.game.possibleSolutions[index]);
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
  void nextQuestion() {
    resetColors();
    app.game.goToNextTurn();
  }
}
