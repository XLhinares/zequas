import "../../utils/utils.dart";
import "../translatable.dart";
import "game_mode.dart";

/// The different possible gamemodes.
class GameCategory extends Translatable {
  // VARIABLES =================================================================

  /// The list of [GameMode] that are part of this category.
  late final List<GameMode> modes;

  // GETTERS ===================================================================

  /// The title of the category.
  ///
  /// For the localization to work, it need to be associated to the "title" key
  /// of the [rawTranslation] member.
  String get title => "${name}_title";

  /// The description of the category.
  ///
  /// For the localization to work, it need to be associated to the  "desc" key
  /// of the [rawTranslation] member.
  String get description => "${name}_desc";

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [Gamemode] matching the given parameters.
  GameCategory({
    required String name,
    required super.rawTranslations,
    List<GameMode>? modes,
  }) : super(
    name: "category_$name",
  ) {
    this.modes = (modes ?? []).map((e) => GameMode(
      name: e.name,
      rawTranslations: e.rawTranslations,
      ancestorName: this.name,
      generator: e.generator,
    )).toList();
  }

  // OVERRIDES =================================================================

  @override
  Map<String, Map<String, String>> get subTranslations {

    final Map<String, Map<String, String>> mergedTranslations = {};

    // Copy the translations of the category.

    for (final key in rawTranslations.keys) {
      mergedTranslations[key] = {...rawTranslations[key]!};
    }

    // Adds the translations of the modes.
    for (final mode in modes) {
      addTranslations(
          source: mergedTranslations,
          newTranslations: mode.translations
      );
    }

    return mergedTranslations;
  }
}