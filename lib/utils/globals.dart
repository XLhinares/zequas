import "package:flutter/material.dart";
import "package:flutter_emoji/flutter_emoji.dart";
import "package:x_containers/x_containers.dart";

import "../classes/game.dart";
import "../classes/settings.dart";

// SINGLETONS ==================================================================

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
  emojiParser.emojify(":bear:"),
  emojiParser.emojify(":panda_face:"),
  emojiParser.emojify(":chipmunk:"),
];

/// A random emoji from the [emojis] list.
String get randomEmoji {
  emojis.shuffle();
  return emojis.first;
}

/// A random emoji from the [emojis] list or a "x", according to [settings.emojifyQuestions].
String get randomVariable {
  if (settings.emojifyQuestions.value) {
    return randomEmoji;
  } else {
    return "x";
  }
}

// COLOR SCHEME ================================================================

/// An extension on the [Colors] class to add the colors of this theme.
extension DefaultColors on Colors {
  /// The color used for black text.
  static Color textBlack = Colors.black.withOpacity(0.7);
}

/// A pastel theme data.
ThemeData themePastel = xTheme.getTheme(
  primary: const Color(0xFFE0AA3A),
  secondary: const Color(0xFFEF596C),
  background: const Color(0xFF689BA6),
  backgroundAlt: const Color(0xFF689BA6),
  cardColor: Colors.white.withOpacity(0.7),
);
