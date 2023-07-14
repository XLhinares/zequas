import "../classes/game/game_category.dart";
import "../classes/game/game_mode.dart";
import "../classes/solvables/solvables.dart";
import "globals.dart";

/// Runs after the initialization of the global variables to populate the data
/// where needed.
void postInitialize () {

  game.addModeCategory(GameCategory(
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
      ]
  ));

  game.addModeCategory(GameCategory(
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
      ]
  ));

  game.addModeCategory(GameCategory(
      name: "percentage",
      rawTranslations: {
        "en": {
          "title": "Percentage",
          "desc": "Compute a percentage or a sale.",
        },
        "fr": {
          "title": "Pourcentage",
          "desc": "Calcule un pourcentage ou une promotion.",
        }
      },
      modes: [
        GameMode(
            name: "percentage",
            rawTranslations: {
              "en": {
                "title": "Percentage",
                "desc": "A% of B",
                "percentage_of": "@percentage% of @value",
              },
              "fr": {
                "title": "Pourcentage",
                "desc": "A% de B",
                "percentage_of": "@percentage% de @value",
              }
            },
            generator: ({localizationPrefix}) => Percentage(localizationPrefix: localizationPrefix),
        ),
        GameMode(
            name: "sale",
            rawTranslations: {
              "en": {
                "title": "Sales",
                "desc": "A on sale with B% off",
                "sales_down": "@value goes down @percentage%",
                "sales_up": "@value goes up @percentage%",
              },
              "fr": {
                "title": "Promotions",
                "desc": "A avec B% de promo",
                "sales_down": "@value diminue de @percentage%",
                "sales_up": "@value augmente de @percentage%",
              }
            },
            generator: ({localizationPrefix}) => Sale(localizationPrefix: localizationPrefix),
        ),
      ]
  ));
}