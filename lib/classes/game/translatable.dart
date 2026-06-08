import "../../utils/globals.dart" as global;

/// An abstract class that can be easily translated.
abstract class Translatable {
  // VARIABLES =================================================================

  /// The name of the object.
  ///
  /// It is used as a prefix for the translation keys to not overlap with other keys.
  final String name;

  /// The map containing the raw translations (no name)
  final Map<String, Map<String, String>> rawTranslations;

  /// The name of ancestor widgets if there are any
  final String? ancestorName;

  // GETTERS ===================================================================

  /// Returns a map resulting from the merge of [rawTranslations] and any
  /// possible translation from a sub-class.
  ///
  /// It is used for instance in [GameCategory] to access the translations from
  /// the [GameMode].
  Map<String, Map<String, String>> get subTranslations => rawTranslations;

  /// The cleaned map of the translations with the proper name.
  Map<String, Map<String, String>> get translations {
    final Map<String, Map<String, String>> result = {};

    for (final locale in subTranslations.keys) {
      final Map<String, String> localizedResult = {};
      for (final key in subTranslations[locale]!.keys) {
        localizedResult["${name}_$key"] = subTranslations[locale]![key]!;
      }
      result[locale] = localizedResult;
    }

    return result;
  }

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [Translatable] matching the given parameters.
  const Translatable({
    required this.name,
    this.rawTranslations = const {},
    this.ancestorName,
  });

  // METHODS ===================================================================

  /// Adds the translations to the
  void addGlobalTranslations() {
    for (final language in global.translations.keys.keys) {
      // dlog(translations[language].toString());
      global.translations.keys[language]?.addAll(translations[language] ?? {});
    }
  }
}
