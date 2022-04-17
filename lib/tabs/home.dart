// Flutter dependencies
import "package:flutter/material.dart";
import "package:get/get.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";
import "package:zequas/tabs/settings.dart";

// Project dependencies
import "package:zequas/classes/game.dart";
import "package:zequas/widgets/home/game_mode_panel.dart";
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
        title: const Text(
          "Zequas",
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
          GamemodePanel(
            title: "Équations",
            description: "Trouver la valeur inconnue dans une équation simple.",
            displayedModes: const [
              Gamemode.addition,
              Gamemode.multiplication,
              Gamemode.equation,
            ],
          ),
          XLayout.verticalM,
          GamemodePanel(
            title:"Pourcentages",
            description: "Calculer un pourcentage ou une promotion.",
            displayedModes: const [
              Gamemode.percentage,
              Gamemode.sale,
            ],
          ),
        ],
      ),
    );
  }

}
