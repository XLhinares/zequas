import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../utils/globals.dart";
import "settings.dart";
import "../widgets/home/game_category_panel.dart";
import "../widgets/layout/scaffold_fit.dart";

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
      padding: EdgeInsets.symmetric(horizontal: XLayout.paddingM),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: XLayout.paddingM),
        itemCount: game.categories.length,
        itemBuilder: (context, index) => GameCategoryPanel(
          category: game.categories[index],
        ),
        separatorBuilder: (context, index) => XLayout.verticalM,
      ),
    );
  }

}
