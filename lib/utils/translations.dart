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
      "settings_app_locale": "Locale",
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
    }
  };
}