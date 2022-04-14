// Package dependencies
import "dart:math";

// Package dependencies
import "package:flutter/material.dart";
import "package:flutter_emoji/flutter_emoji.dart";
import "package:fraction/fraction.dart";

// Project dependencies
import "package:zequas/classes/game.dart";
import "package:zequas/classes/settings.dart";
import "package:zequas/classes/user.dart";

// SINGLETONS ==================================================================

/// The user of the app.
User user = User();

/// In-app representation of the game being played.
Game game = Game();

/// The saved settings.
Settings settings = Settings();

/// A parser for emojify-ed text.
EmojiParser emojiParser = EmojiParser();

/// A list of emoji to use.
List<String> emojis = [
  emojiParser.emojify(":tada:"),
  emojiParser.emojify(":rat:"),
  emojiParser.emojify(":mouse2:"),
  emojiParser.emojify(":ox:"),
  emojiParser.emojify(":water_buffalo:"),
  emojiParser.emojify(":cow2:"),
  emojiParser.emojify(":tiger2:"),
  emojiParser.emojify(":leopard:"),
  emojiParser.emojify(":rabbit2:"),
  emojiParser.emojify(":black_cat:"),
  emojiParser.emojify(":cat2:"),
  emojiParser.emojify(":dragon:"),
  emojiParser.emojify(":crocodile:"),
  emojiParser.emojify(":whale2:"),
  emojiParser.emojify(":snail:"),
  emojiParser.emojify(":snake:"),
  emojiParser.emojify(":racehorse:"),
  emojiParser.emojify(":ram:"),
  emojiParser.emojify(":goat:"),
  emojiParser.emojify(":sheep:"),
  emojiParser.emojify(":monkey:"),
  emojiParser.emojify(":rooster:"),
  emojiParser.emojify(":chicken:"),
  emojiParser.emojify(":service_dog:"),
  emojiParser.emojify(":dog2:"),
  emojiParser.emojify(":pig2:"),
  emojiParser.emojify(":boar:"),
  emojiParser.emojify(":elephant:"),
  emojiParser.emojify(":octopus:"),
  emojiParser.emojify(":shell:"),
  emojiParser.emojify(":bug:"),
  emojiParser.emojify(":ant:"),
  emojiParser.emojify(":bee:"),
  emojiParser.emojify(":honeybee:"),
  emojiParser.emojify(":ladybug:"),
  emojiParser.emojify(":lady_beetle:"),
  emojiParser.emojify(":fish:"),
  emojiParser.emojify(":tropical_fish:"),
  emojiParser.emojify(":blowfish:"),
  emojiParser.emojify(":turtle:"),
  emojiParser.emojify(":hatching_chick:"),
  emojiParser.emojify(":baby_chick:"),
  emojiParser.emojify(":hatched_chick:"),
  emojiParser.emojify(":bird:"),
  emojiParser.emojify(":penguin:"),
  emojiParser.emojify(":koala:"),
  emojiParser.emojify(":poodle:"),
  emojiParser.emojify(":dromedary_camel:"),
  emojiParser.emojify(":camel:"),
  emojiParser.emojify(":dolphin:"),
  emojiParser.emojify(":flipper:"),
  emojiParser.emojify(":mouse:"),
  emojiParser.emojify(":cow:"),
  emojiParser.emojify(":tiger:"),
  emojiParser.emojify(":rabbit:"),
  emojiParser.emojify(":cat:"),
  emojiParser.emojify(":dragon_face:"),
  emojiParser.emojify(":whale:"),
  emojiParser.emojify(":horse:"),
  emojiParser.emojify(":monkey_face:"),
  emojiParser.emojify(":dog:"),
  emojiParser.emojify(":pig:"),
  emojiParser.emojify(":frog:"),
  emojiParser.emojify(":hamster:"),
  emojiParser.emojify(":wolf:"),
  emojiParser.emojify(":polar_bear:"),
  emojiParser.emojify(":bear:"),
  emojiParser.emojify(":panda_face:"),
  emojiParser.emojify(":chipmunk:"),
];

/// A random emoji from the [emojis] list.
String get randomEmoji {
  emojis.shuffle();
  return emojis.first;
}

// COLOR SCHEME ================================================================

/// The primary color of the app.
Color cPrimary = const Color(0xFF689BA6);

/// The secondary color of the app.
Color cSecondary = const Color(0xFFE0AA3A);

/// The accent color of the app.
Color cAccent = const Color(0xFFEF596C);

// FUNCTIONS ===================================================================

/// An extension on the [Fraction] class to display decimal strings instead of
/// simple fractions.
extension AutoString on Fraction {

  /// Returns a string instead of a simple fraction if possible, and a regular
  /// fraction otherwise.
  String autoString ({int allowedDecimals = 2}) {
    final double allowedError = pow(10, -(10 - allowedDecimals)).toDouble();
    final double boostedValue = pow(10, allowedDecimals).toDouble() * toDouble();
    if ((boostedValue - boostedValue.truncateToDouble()).abs() < allowedError) {
      // print("printing ${toDouble()} instead of $this");
      return toDouble().toString();
    } else {
      return reduce().toString();
    }
  }
}

/// Return a random Fraction
Fraction randomFraction({
  int start = 0,
  required int end,
  int decimals = 0,
  bool canBeZero = false,
}) {
  final Random random = Random();
  int scale = pow(10, decimals).toInt();
  int numerator = 0;
  while (numerator == 0) {
    numerator = random.nextInt((end - start) * scale) + start * scale;
  }
  return Fraction(numerator, scale);
}