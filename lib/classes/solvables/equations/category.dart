import "../../game/game_category.dart";
import "../../game/game_mode.dart";
import "addition.dart";
import "equation.dart";
import "multiplication.dart";

/// A [GameCategory] for equation-related questions.
GameCategory gameCategoryEquations = GameCategory(
  name: "equation",
  rawTranslations: {
    "en": {
      "title": "Equations",
      "desc": "Find the missing value in a simple equation.",
    },
    "fr": {
      "title": "Équations",
      "desc": "Trouve la valeur inconnue dans une équation simple.",
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
      generator: ({localizationPrefix}) => EquationAddition(),
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
      generator: ({localizationPrefix}) => EquationMultiplication(),
    ),
    GameMode(
      name: "Equations",
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
      generator: ({localizationPrefix}) => EquationFull(),
    ),
  ],
);
