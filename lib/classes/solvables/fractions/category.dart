import "../../game/game_category.dart";
import "../../game/game_mode.dart";
import "addition.dart";
import "equation.dart";
import "multiplication.dart";

/// A [GameCategory] for fraction-related questions.
GameCategory gameCategoryFractions = GameCategory(
  name: "fraction",
  rawTranslations: {
    "en": {
      "title": "Fractions",
      "desc": "Find the result of a fraction calculation.",
    },
    "fr": {
      "title": "Fractions",
      "desc": "Trouve le résultat d'un calcul impliquant des fractions.",
    }
  },
  modes: [
    GameMode(
      name: "addition",
      rawTranslations: {
        "en": {
          "title": "Additions",
          "desc": "A + B = C",
        },
        "fr": {
          "title": "Additions",
          "desc": "A + B = C",
        }
      },
      generator: ({localizationPrefix}) => FractionAddition(),
    ),
    GameMode(
      name: "multiplication",
      rawTranslations: {
        "en": {
          "title": "Multiplications",
          "desc": "A * B = C",
        },
        "fr": {
          "title": "Multiplications",
          "desc": "A * B = C",
        }
      },
      generator: ({localizationPrefix}) => FractionMultiplication(),
    ),
    GameMode(
      name: "equation",
      rawTranslations: {
        "en": {
          "title": "Equations",
          "desc": "A + B * C = D",
        },
        "fr": {
          "title": "Équations",
          "desc": "A + B * C = D",
        }
      },
      generator: ({localizationPrefix}) => FractionEquation(),
    ),
  ],
);
