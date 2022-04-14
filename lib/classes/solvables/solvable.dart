// Flutter dependencies
import "dart:math";

// Project dependencies
import "package:zequas/classes/game.dart";
import "package:zequas/classes/solvables/equation.dart";
import "package:zequas/classes/solvables/test.dart";
import "package:zequas/utils/globals.dart";

/// In-app representation of a question to be solved.
abstract class Solvable {

  // VARIABLES =================================================================

  /// The question to solve.
  late final String question;

  /// The actual solution to the question.
  late final String solution;

  /// A list of possible solutions to the question.
  final List<String> possibleSolutions = [];

  /// Maximum number of possible solutions to the solvable.
  ///
  /// It should be constant regardless of the generation question.
  /// If an infinite number of fake solutions can be generated, it should be
  /// set to `-1`.
  late final int maxFakeSolutions;

  // GETTERS ===================================================================

  /// The number of possible solutions that should be generated
  int get fakeSolutionsLength => maxFakeSolutions == -1
      ? settings.numberOfPossibleSolutions - 1
      : min(settings.numberOfPossibleSolutions - 1, maxFakeSolutions);

  // CONSTRUCTOR ===============================================================

  /// Returns the instance of [Solvable] generated using the seed.
  Solvable({int? seed,});

  /// Returns the subclass of [Solvable] matching the given gamemode.
  factory Solvable.fromMode ({
    Gamemode mode = Gamemode.none,
    int? seed,
  }) {
    switch (mode) {
      case Gamemode.equation:
        return Equation(seed: seed);
      default:
        return TestSolvable();
    }
  }

  // METHODS ===================================================================

  /// Prepares the question, the solution and the possible solution list.
  void prepare () {
    question = generateQuestion();
    solution = generateSolution();

    possibleSolutions.add(solution);
    for (int i = 0 ; i < fakeSolutionsLength ; i++) {
      possibleSolutions.add(generateFakeSolution());
    }

    possibleSolutions.shuffle();
  }

  /// How to generate the question.
  String generateQuestion();

  /// How to generate the solution.
  String generateSolution();

  /// How to generate a fake solution.
  String generateFakeSolution();

}