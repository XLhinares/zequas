// Flutter dependencies
import "package:flutter/material.dart";
import "package:get/get.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";
import "package:zequas/tabs/settings.dart";

// Project dependencies
import "package:zequas/classes/game.dart";
import "package:zequas/utils/globals.dart";
import "package:zequas/tabs/game.dart";
import "package:zequas/widgets/layout/scaffold_fit.dart";

/// The home tab of the game.
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
    return ScaffoldFit(
      appBar: AppBar(
        title: Text(
          "Zequas",
          style: Get.textTheme.titleMedium,
        ),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const TabSettings()),
              icon: const Icon(Icons.settings),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: xPaddingM),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkContainer(
            child: const Text("Addition"),
            onTap: () => goToGame(mode: Gamemode.addition),
          ),
          XLayout.verticalM,
          InkContainer(
            child: const Text("Multiplication"),
            onTap: () => goToGame(mode: Gamemode.multiplication),
          ),
          XLayout.verticalM,
          InkContainer(
            child: const Text("Equation"),
            onTap: () => goToGame(mode: Gamemode.equation),
          ),
          XLayout.verticalM,
          InkContainer(
            child: const Text("Pourcentage"),
            onTap: () => goToGame(mode: Gamemode.percentage),
          ),
          XLayout.verticalM,
          InkContainer(
            child: const Text("Promos"),
            onTap: () => goToGame(mode: Gamemode.sale),
          ),
        ],
      ),
    );
  }

  // METHODS ===================================================================

  /// Sets the gamemode to the given value and goes to the [Game] tab.
  void goToGame ({required Gamemode mode}) {
    game.mode = mode;
    game.reset();
    Get.to(() => TabGame());
  }

}
