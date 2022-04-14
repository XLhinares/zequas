/// The settings that should be saved to memory.
class Settings {

  // VARIABLES =================================================================

  /// The number of turns of a game.
  int gameLength = 5;

  /// The number of possible solutions to a given solvable.
  int numberOfPossibleSolutions = 4;

  // CONSTRUCTOR ===============================================================

  /// The value of the singleton.
  ///
  /// It is both static and final meaning it can only be instantiated once.
  static final Settings _instance = Settings._internal();

  /// Returns the unique instance of the class.
  factory Settings() => _instance;

  /// The actual constructor of the class.
  Settings._internal();

  // METHODS ===================================================================

}