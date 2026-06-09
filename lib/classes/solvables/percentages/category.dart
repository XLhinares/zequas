import "../../game/game_category.dart";
import "../../game/game_mode.dart";
import "percentage.dart";
import "sale.dart";

/// A [GameCategory] for percentage-related questions.
GameCategory gameCategoryPercentages = GameCategory(
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
      generator: ({localizationPrefix}) =>
          Percentage(localizationPrefix: localizationPrefix),
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
      generator: ({localizationPrefix}) =>
          Sale(localizationPrefix: localizationPrefix),
    ),
  ],
);
