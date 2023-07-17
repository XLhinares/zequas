import "package:get/get.dart";

/// An extension of the [Translations] class, for our custom needs.
class CustomTranslations extends Translations {

  @override
  Map<String, Map<String, String>> keys = {
    // ENGLISH =================================================================
    "en": {
      // GENERAL
      "yes": "Yes",
      "no": "No",

      // GAME
      "game_leave": "Leave",
      "game_leave_desc": "Are you sure you want to end the game?",
      "solvable_answer_none": "None of the other choices",

      // END SCREEN
      "success_rate": "Success rate:",
      "score": "Score:",
      "solution": "Solution: @solution",
      "attempt": "@attempts attempt",
      "attempts": "@attempts attempts",
      "back_to_menu": "Back to menu",

      // SETTINGS
      "settings": "Settings",
      "settings_game": "Game settings",
      "settings_game_desc": "",
      "settings_game_questions": "Number of questions",
      "settings_game_choices": "Number of choices",
      "settings_game_emojis": "Use emojis",
      "settings_game_emojis_desc": "Show emojis instead of a 'x' in the questions",
      "settings_app": "App settings",
      "settings_app_desc": "App settings",
      "settings_app_locale": "Locale",
      "settings_app_locale_desc": "Pick your favorite language",
      "settings_credits": "Credits",
      "settings_credits_desc": "Thank you for using my app!",
      "settings_credits_site": "Made by Xeppelin",
      "settings_credits_site_desc": "Here's a link to my website if you wanna learn more about me.",
      "settings_credits_bmac": "Buy me a pizza",
      "settings_credits_bmac_desc": "If you appreciate my work, feel free to buy me a slice of pizza by clicking here.",
      "settings_credits_ad": "Watch an ad",
      "settings_credits_ad_desc": "Alternatively, if you want to help but a slice of pizza is too much, you can click here and watch an ad :)",
    },
    "fr": {
      // GENERAL
      "yes": "Oui",
      "no": "Non",

      // GAME
      "game_leave": "Quitter",
      "game_leave_desc": "Êtes-vous sûr de vouloir arrêter cette session?",
      "solvable_answer_none": "Aucun des autres choix",

      // END SCREEN
      "success_rate": "Taux de réussite:",
      "score": "Score:",
      "solution": "Solution: @solution",
      "attempt": "@attempts essai",
      "attempts": "@attempts essais",
      "back_to_menu": "Retour au menu",

      // SETTINGS
      "settings": "Paramètres",
      "settings_game": "Paramètres de jeu",
      "settings_game_desc": "Les paramètres affectant la manière dont une partie se déroule.",
      "settings_game_questions": "Nombre de questions",
      "settings_game_choices": "Nombre de choix",
      "settings_game_emojis": "Emojiser les questions",
      "settings_game_emojis_desc": "Montrer un emoji plutôt que 'x' dans les questions.",
      "settings_app": "Paramètres de l'app",
      "settings_app_locale": "Langage",
      "settings_app_locale_desc": "Choisis ta langue favorite",
      "settings_credits": "Crédits",
      "settings_credits_desc": "Merci d'utiliser mon application!",
      "settings_credits_site": "Développé par Xeppelin",
      "settings_credits_site_desc": "Ci-joint, un lien pour accéder à mon site si tu veux en savoir plus sur moi.",
      "settings_credits_bmac": "Offre moi une pizza",
      "settings_credits_bmac_desc": "Si tu aimes mon travail, tu peux m'acheter une part de pizza en cliquant ici.",
      "settings_credits_ad": "Regarder une pub",
      "settings_credits_ad_desc": "Sinon, si tu veux aider mais qu'une part de pizza c'est trop, tu peux cliquer ici et regarder une pub :)",
    }
  };
}