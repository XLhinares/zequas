// Package dependencies
import "dart:async";
import "dart:ui";

import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

import "../utils/globals.dart";

/// A singleton handling the shared preferences and the memory of the app.
class Settings extends GetxController {

  // VARIABLES =================================================================

  // META ----------------------------------------------------------------------

  /// Whether the database was loaded.
  final RxBool loaded = false.obs;

  /// The [SharedPreferences] object that keeps track of everything.
  late final GetStorage _storage;

  // ACTUAL --------------------------------------------------------------------

  /// The number of turns in a game.
  late final RxInt gameLength;

  /// The number of possible solutions to a given solvable.
  late final RxInt numberOfPossibleSolutions;

  /// Whether to show emojis rather than "x" in the relevant questions.
  late final RxBool emojifyQuestions;

  /// The locale used for the language of the app.
  late final RxString locale;

  /// Whether the user is allowing the cookies.
  late final RxBool cookies;

  /// Whether the user has dismissed the cookie banner.
  late final RxBool cookieBannerDismissed;

  // CONSTRUCTOR ===============================================================

  /// The private instance of [Settings].
  ///
  /// It insures that the class is instantiated only once at the beginning.
  static final Settings _instance = Settings._internal();

  /// Returns the unique [Settings] instance.
  factory Settings() => _instance;

  /// The real constructor of the class.
  ///
  /// It is called exactly once and contains the instantiation logic.
  Settings._internal() {
    _init();
  }

  Future<void> _init () async {
    // Instantiating variables.
    _storage = GetStorage();

    // COOKIES
    cookies = RxBool(_storage.read<bool>("cookies") ?? true);
    _saveCookies(cookies.value);
    cookieBannerDismissed = RxBool(cookies.value);

    gameLength = RxInt(_storage.read<int>("gameLength") ?? 4);
    _saveGameLength(gameLength.value);

    numberOfPossibleSolutions = RxInt(_storage.read<int>("numberOfPossibleSolutions") ?? 4);
    _saveNumberOfPossibleSolutions(numberOfPossibleSolutions.value);

    emojifyQuestions = RxBool(_storage.read<bool>("emojifyQuestions") ?? true);
    _saveEmojifyQuestions(emojifyQuestions.value);

    // LOCALE
    locale = RxString(_storage.read<String>("locale") ?? "en");
    _saveLocale(locale.value);

    // Setting up workers.
    ever<int>(gameLength, _saveGameLength);
    ever<int>(numberOfPossibleSolutions, _saveNumberOfPossibleSolutions);
    ever<bool>(emojifyQuestions, _saveEmojifyQuestions);
    ever<String>(locale, _saveLocale);


    // All done.
    loaded.value = true;
    print("Settings loaded");
    update();
  }

// METHODS ===================================================================

  /// Performs a check on the value of [gameLength] then save it to memory.
  void _saveGameLength (int value) {
    print("saving game length");
    if (value < 3) {
      gameLength.value = 3;
    } else if (value > 20) {
      gameLength.value = 20;
    }

    _storage.write("gameLength", value);
  }

  /// Performs a check on the value of [_saveNumberOfPossibleSolutions] then save it to memory.
  void _saveNumberOfPossibleSolutions (int value) {
    if (value < 3) {
      numberOfPossibleSolutions.value = 3;
    } else if (value > 6) {
      numberOfPossibleSolutions.value = 6;
    }

    _storage.write("numberOfPossibleSolutions", value);
  }

  /// Saves the value of [emojifyQuestions] to memory.
  void _saveEmojifyQuestions (bool value) {
    _storage.write("emojifyQuestions", value);
  }

  /// Performs a check on the value of the [locale] then save it to memory.
  Future<void> _saveLocale(String value) async {
    printInfo(info: "Changing locale to: $value");
    Get.updateLocale(Locale(value));

    if (cookies.isFalse) return;
    await _storage.write("locale", value);
  }

  /// Rotates between the different supported locales.
  Future<void> rotateLocale() async {
    final int index = supportedLocales.indexOf(locale.value);
    final String newLocale =
    supportedLocales[(index + 1) % supportedLocales.length];
    locale.value = newLocale;
  }

  /// Performs a check on the value of [cookies] then save it to memory.
  Future<void> _saveCookies(bool value) async {
    printInfo(info: "Changing cookies to: $value");

    if (value) {
      await _storage.write("cookies", value);
      // Try to save all the data that was not save due to cookies.
      await _saveLocale(locale.value);
    } else {
      _clearCookies();
    }
  }

  /// Deletes the cookies.
  Future<void> _clearCookies() async {
    await _storage.remove("cookies");
    await _storage.remove("locale");
    await _storage.remove("theme");
  }
}