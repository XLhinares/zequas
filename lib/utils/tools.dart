import "dart:math";

import "package:flutter/material.dart";

import "globals.dart";

// EMOJIS ======================================================================

/// A random emoji from the [emojis] list.
String get randomEmoji {
  final int randomIndex = Random().nextInt(emojis.length);
  return emojis[randomIndex];
}

/// A random emoji from the [emojis] list or a "x", according to [settings.emojifyQuestions].
String get randomVariable {
  if (settings.emojifyQuestions.value) {
    return randomEmoji;
  } else {
    return "x";
  }
}

// EXTENSIONS ==================================================================

/// An extension on the [Colors] class to add the colors of this theme.
extension DefaultColors on Colors {
  /// The color used for black text.
  static Color textBlack = Colors.black.withOpacity(0.7);
}

/// An extension on [String?] that adds an underscore character if the element
/// is not null, and returns an empty string otherwise.
extension UnderscoreIfNotNull on String? {

  /// Returns the element with an underscore character at the end if it is not
  /// null, and an empty string otherwise.
  String get underscoreIfNotNull => this == null
      ? ""
      : "${this}_";
}

// TRANSLATIONS ================================================================

/// Add new translations to a translation map.
void addTranslations ({
  required Map<String, Map<String, String>> source,
  required Map<String, Map<String, String>> newTranslations
}) {

  for (final key in newTranslations.keys) {

    // In case there is a locale that the source doesn't handle, it is added.
    if (!source.containsKey(key)) {
      source[key] = {};
    }

    for (final localizedKey in newTranslations[key]!.keys) {
      source[key]![localizedKey] = newTranslations[key]![localizedKey]!;
    }
  }
}