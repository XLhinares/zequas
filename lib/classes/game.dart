// Package dependencies
import "dart:collection";

import "package:get/get.dart";

// Project dependencies
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/tabs/game.dart";
import "package:zequas/classes/gamemode.dart";
import "package:zequas/tabs/game_summary.dart";
import "package:zequas/utils/globals.dart";
import "package:zequas/classes/archived_turn.dart";

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
  /// They are generated according to the gamemode by the method [_prepareNewGame] when
  /// a new game starts.
  final List<Solvable> _turns = [];

  final List<ArchivedTurn> _history = [];

  /// The index of the current turn.
  int _index = -1;

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

  // GETTERS ===================================================================

  /// The archives of the game turns.
  UnmodifiableListView<ArchivedTurn> get history => UnmodifiableListView(_history);

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

  /// Creates a new game in the given gamemode and navigates to the game tab.
  void start ({Gamemode mode = Gamemode.none}) {
    print("a: $mode");
    this.mode = mode;
    _prepareNewGame();

    // Manually start tracking the first turn.
    _history[0].start();
    Get.to(() => TabGame());
  }

  /// Resets the index and generates a new set of turns according to the gamemode.
  void _prepareNewGame() {
    _index = 0;
    _turns.clear();
    _history.clear();

    for (int i = 0 ; i < settings.gameLength.value ; i++) {

      final Solvable turn = Solvable.fromMode(
        mode: mode,
        seed: i,
      );
      _turns.add(turn);
      _history.add(ArchivedTurn(
        question: turn.question,
        solution: turn.solution,
      ),);
    }
  }

  /// Goes to the next turn index and updates the possible [GetBuilder].
  void goToNextTurn () {
    _history[_index].end();

    if (playingLastTurn) {
      Get.off(() => GameSummary());
    } else {
      _index++;
      _history[_index].start();
    }
    update();
  }

  /// Goes to the next turn index and updates the possible [GetBuilder].
  void goToEnd () {
    _index = _turns.length - 1;
  }

  /// Checks if an answer is right
  bool submitAnswer(String answer) {
    print("$answer & $_solution");
    _history[_index].newAttempt();
    if (_solution == answer) {
      return true;
    } else {
      return false;
    }
  }

}