// Package dependencies
import "dart:async";

import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

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
  RxInt gameLength = RxInt(5);

  /// The number of possible solutions to a given solvable.
  RxInt numberOfPossibleSolutions = RxInt(4);

  /// Whether to show emojis rather than "x" in the relevant questions.
  RxBool emojifyQuestions = RxBool(true);

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

    gameLength.value = _storage.read<int>("gameLength") ?? 4;
    numberOfPossibleSolutions.value = _storage.read<int>("numberOfPossibleSolutions") ?? 4;
    emojifyQuestions.value = _storage.read<bool>("emojifyQuestions") ?? true;

    // Setting up workers.
    ever<int>(gameLength, saveGameLength);
    ever<int>(numberOfPossibleSolutions, saveNumberOfPossibleSolutions);
    ever<bool>(emojifyQuestions, saveEmojifyQuestions);


    // All done.
    loaded.value = true;
    print("Settings loaded");
    update();
  }

// METHODS ===================================================================

  /// Performs a check on the value of [gameLength] then save it to memory.
  void saveGameLength (int value) {
    print("saving game length");
    if (value < 3) {
      gameLength.value = 3;
    } else if (value > 20) {
      gameLength.value = 20;
    }

    _storage.write("gameLength", value);
  }

  /// Performs a check on the value of [saveNumberOfPossibleSolutions] then save it to memory.
  void saveNumberOfPossibleSolutions (int value) {
    if (value < 3) {
      numberOfPossibleSolutions.value = 3;
    } else if (value > 6) {
      numberOfPossibleSolutions.value = 6;
    }

    _storage.write("numberOfPossibleSolutions", value);
  }

  /// Saves the value of [emojifyQuestions] to memory.
  void saveEmojifyQuestions (bool value) {
    _storage.write("emojifyQuestions", value);
  }
}