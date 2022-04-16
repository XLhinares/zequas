// Package dependencies
import "dart:async";

import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

/// A singleton handling the shared preferences and the memory of the app.
class Settings extends GetxController {

  // VARIABLES =================================================================

  /// Whether the database was loaded.
  final RxBool loaded = false.obs;

  /// The [SharedPreferences] object that keeps track of everything.
  late final SharedPreferences _prefs;

  /// The number of turns in a game.
  RxInt gameLength = RxInt(5);

  ///The number of possible solutions to a given solvable.
  RxInt numberOfPossibleSolutions = RxInt(4);

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
    _prefs = await SharedPreferences.getInstance();

    gameLength = RxInt(_prefs.getInt("gameLength") ?? 4);
    numberOfPossibleSolutions = RxInt(_prefs.getInt("numberOfPossibleSolutions") ?? 4);

    // Setting up workers.
    ever<int>(gameLength, saveGameLength);
    ever<int>(numberOfPossibleSolutions, saveNumberOfPossibleSolutions);


    // All done.
    Timer(const Duration(seconds: 3), () {
      loaded.value = true;
      print("Settings loaded");
      update();
    });
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

    _prefs.setInt("gameLength", value);
  }

  /// Performs a check on the value of [saveNumberOfPossibleSolutions] then save it to memory.
  void saveNumberOfPossibleSolutions (int value) {
      if (value < 3) {
        numberOfPossibleSolutions.value = 3;
      } else if (value > 6) {
        numberOfPossibleSolutions.value = 6;
      }

    _prefs.setInt("numberOfPossibleSolutions", value);
  }
}