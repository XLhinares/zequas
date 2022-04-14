// Flutter dependencies
import "package:flutter/material.dart";
import "package:get/get.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";

// Project dependencies
import "package:zequas/utils/layout_globals.dart";
import "package:zequas/classes/game.dart";
import "package:zequas/utils/globals.dart";
import "package:zequas/tabs/game.dart";

/// The home tab of the game.
///
///
/// If no gamemode is selected, the user can chose one.
class Home extends StatelessWidget {

  // VARIABLES =================================================================

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [Home] matching the given parameters.
  const Home({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zequas",
          style: Get.textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkContainer(
              child: const Text("Addition"),
              onTap: () => goToGame(mode: Gamemode.addition),
            ),
            Space.verticalM,
            InkContainer(
              child: const Text("Multiplication"),
              onTap: () => goToGame(mode: Gamemode.multiplication),
            ),
            Space.verticalM,
            InkContainer(
              child: const Text("Equation"),
              onTap: () => goToGame(mode: Gamemode.equation),
            ),
          ],
        ),
      ),
    );
  }

  // METHODS ===================================================================

  /// Sets the gamemode to the given value and goes to the [Game] tab.
  void goToGame ({required Gamemode mode}) {
    game.mode = mode;
    game.reset();
    Get.to(() => GameTab());
  }

}
