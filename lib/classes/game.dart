// Package dependencies
import "package:get/get.dart";

// Project dependencies
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/utils/globals.dart";

/// The different possible gamemodes.
enum Gamemode {
  /// No game mode selected.
  none,

  /// Give equations of form `a + x = b`
  addition,

  /// Give equations of form `a * x = b`
  multiplication,

  /// Give equations of form `a * x + b = c`
  equation,

  /// Give calculus like `a% of b`
  percentage,

  /// Give calculus like `a decreased/increased by b%`
  sale,
}

/// The in-app representation of a game.
///
/// It consists of a list of turns generated at the beginning of the game through
/// which we cycle
class Game extends GetxController {

  // VARIABLES =================================================================

  // META ----------------------------------------------------------------------

  /// The current mode of the game.
  Gamemode mode = Gamemode.none;

  /// The list of turns that are going to appear.
  ///
  /// They are generated according to the gamemode by the method [resetGame] when
  /// a new game starts.
  final List<Solvable> _turns = [];

  final List<int> _history = [];

  /// The index of the current turn.
  int _index = 0;

  // GETTERS ===================================================================

  /// The turn currently being played.
  Solvable get _currentTurn => _turns[_index];

  /// Whether the last turn is being played.
  bool get playingLastTurn => _index == _turns.length - 1;

  /// The progress value of the game between 0 and 1.
  double get progress => _turns.isEmpty
      ? 1
      : _index / _turns.length;

  // TURN PROPERTIES -----------------------------------------------------------

  /// The question that should be displayed on the screen.
  String get question => _currentTurn.question;

  /// A list of possible solutions for the current question.
  List<String> get possibleSolutions => _currentTurn.possibleSolutions;

  /// The solution of the current turn.
  ///
  /// It cannot be accessed from outside to prevent cheating.
  /// Instead, the method [submitAnswer] returns true or false.
  String get _solution => _currentTurn.solution;

  // CONSTRUCTOR ===============================================================

  /// The value of the singleton.
  ///
  /// It is both static and final meaning it can only be instantiated once.
  static final Game _instance = Game._internal();

  /// Returns the unique instance of the class.
  factory Game() => _instance;

  /// The actual constructor of the class.
  Game._internal();

  // METHODS ===================================================================

  /// Resets the index and generates a new set of turns according to the gamemode.
  void reset () {
    _index = 0;
    _turns.clear();
    _history.clear();

    for (int i = 0 ; i < settings.gameLength.value ; i++) {
      _turns.add(Solvable.fromMode(
        mode: mode,
        seed: i,
      ));
      _history.add(1);
    }
  }

  /// Goes to the next turn index and updates the possible [GetBuilder].
  void goToNextTurn () {
    _index++;
    update();
  }

  /// Goes to the next turn index and updates the possible [GetBuilder].
  void goToEnd () {
    for (int i = _index ; i < _turns.length ; i++) {
      _history[i] = 0;
    }
    _index = _turns.length - 1;
  }

  /// Checks if an answer is right
  bool submitAnswer(String answer) {
    print("$answer & $_solution");
    if (_solution == answer) {
      return true;
    } else {
      _history[_index]++;
      return false;
    }
  }

  /// Returns the history the last played game.
  List<Map<String, String>> get history => List.generate(
    _index + 1,
        (index) => {
      "question": _turns[index].question,
      "solution": _turns[index].solution,
      "tries": _history[index].toString(),
    },
  );

}