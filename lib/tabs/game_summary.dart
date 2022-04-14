// Flutter dependencies
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "package:zequas/utils/layout_globals.dart";

/// The summary of the game that was just played.
class GameSummary extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [GameSummary] matching the given parameters.
  const GameSummary({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container()
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkContainer(
              margin: const EdgeInsets.all(paddingM),
              onTap: () => Get.back(),
              child: const Text("Retour au menu"),
            ),
          )
        ],
      ),
    );
  }

  // METHODS ===================================================================

}
