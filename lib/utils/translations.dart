import "package:get/get.dart";

/// An extension of the [Translations] class, for our custom needs.
class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> keys = {
    // ENGLISH =================================================================
    "en": {
      // GENERAL
      "app_name": "Zequas",
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
      "settings_game_questions": "Number of questions: @value",
      "settings_game_questions_desc": "The number of questions in a game.",
      "settings_game_choices": "Number of choices: @value",
      "settings_game_choices_desc":
          "The number of answer choices for each question.",
      "settings_game_emojis": "Use emojis",
      "settings_game_emojis_desc":
          "Show emojis instead of a 'x' in the questions",
      "settings_preferences": "Preferences",
      "settings_locale_rotator": "Locale: @value",
      "settings_theme_selection": "Theme",
      "settings_background_selection": "Background",

      "language_en": "EN",
      "language_fr": "FR",
      // THEME
      "theme_light": "Light",
      "theme_dark": "Dark",
      "theme_pastel": "Pastel",
      "theme_halloween": "Halloween",
      "theme_crimson": "Crimson",
      "theme_cottage": "Cottage",
      "theme_rust": "Rust",
      "theme_terminal": "Terminal",
      "theme_oled": "OLED",

      // BACKGROUND
      "background_none": "None",
      "background_wave": "Wave",
      "background_sound": "Sound",
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
      "settings_game_desc":
          "Les paramètres affectant la manière dont une partie se déroule.",
      "settings_game_questions": "Nombre de questions: @value",
      "settings_game_questions_desc":
          "Le nombre de questions qui seront posées au cours d'une partie.",
      "settings_game_choices": "Nombre de choix: @value",
      "settings_game_choices_desc":
          "Le nombres de potentielles solutions proposées à chaque tour.",
      "settings_game_emojis": "Emojiser les questions",
      "settings_game_emojis_desc":
          "Montrer un emoji plutôt que 'x' dans les questions.",
      "settings_preferences": "Préférences",
      "settings_locale_rotator": "Langage: @value",
      "settings_theme_selection": "Thème",
      "settings_background_selection": "Fond",
      // THEMES
      "theme_light": "Clair",
      "theme_dark": "Sombre",
      "theme_pastel": "Pastel",
      "theme_halloween": "Halloween",
      "theme_crimson": "Écarlate",
      "theme_cottage": "Prairie",
      "theme_rust": "Rouille",
      "theme_terminal": "Terminal",
      "theme_oled": "OLED",

      // BACKGROUND
      "background_none": "Aucun",
      "background_wave": "Vague",
      "background_sound": "Onde",
    }
  };
}
