// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

/// A container summarizing the history of a turn.
class HistoryTile extends StatelessWidget {

  // VARIABLES =================================================================

  /// The question that was asked during that turn.
  final String question;

  /// The solution that was expected during that turn.
  final String solution;

  /// The number of attempts it took the user to find the solution.
  final int tries  ;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [HistoryTile] matching the given parameters.
  const HistoryTile({
    Key? key,
    required this.question,
    required this.solution,
    required this.tries
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XCard(
      padding: EdgeInsets.symmetric(
        vertical: xPaddingS,
        horizontal: xPaddingM,
      ),
      title: Text(
        question,
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.black87),
      ),
      subtitle: Text(
        "Solution: $solution",
        style: Get.textTheme.bodySmall!.copyWith(color: Colors.black87),
      ),
      trailing: Text(
        "$tries essais",
        style: Get.textTheme.bodySmall!.copyWith(color: Colors.black87),
      ),
    );
  }

// METHODS ===================================================================

}
