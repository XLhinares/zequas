import "../../utils/utils.dart";
import "../solvables/solvable.dart";
import "../translatable.dart";

/// The different possible gamemodes.
class GameMode extends Translatable {

  /// A function able to generate
  final Solvable Function({String? localizationPrefix})? generator;

  /// The title of the mode.
  ///
  /// For the localization to work, it need to be associated to the "title" key
  /// of the [rawTranslation] member.
  String get title => "${ancestorName.underscoreIfNotNull}${name}_title";

  /// The description of the mode.
  ///
  /// For the localization to work, it need to be associated to the  "desc" key
  /// of the [rawTranslation] member.
  String get description => "${ancestorName.underscoreIfNotNull}${name}_desc";

  /// Returns an instance of [Gamemode] matching the given parameters.
  const GameMode({
    required super.name,
    required super.rawTranslations,
    super.ancestorName = "mode",
    this.generator,
  });

  // METHODS ===================================================================

  /// Returns a random Solvable instance according to the generator.
  Solvable generateSolvable() {
    if (generator == null) throw UnimplementedError();
    return generator!(
      localizationPrefix: "${ancestorName.underscoreIfNotNull}$name",
    );
  }
}