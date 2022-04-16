// Flutter dependencies
import "dart:math";

// Project dependencies
import "package:zequas/classes/game.dart";
import "package:zequas/classes/solvables/equations/addition.dart";
import "package:zequas/classes/solvables/equations/equation.dart";
import "package:zequas/classes/solvables/equations/multiplication.dart";
import "package:zequas/classes/solvables/percentages/percentage.dart";
import "package:zequas/classes/solvables/test.dart";
import "package:zequas/utils/globals.dart";

import "percentages/sale.dart";

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
  int maxFakeSolutions = -1;

  /// A random number generator.
  final Random random = Random();

  // GETTERS ===================================================================

  /// The number of possible solutions that should be generated
  int get fakeSolutionsLength => maxFakeSolutions == -1
      ? settings.numberOfPossibleSolutions.value - 1
      : min(settings.numberOfPossibleSolutions.value - 1, maxFakeSolutions);

  // CONSTRUCTOR ===============================================================

  /// Returns the instance of [Solvable] generated using the seed.
  Solvable({int? seed,});

  /// Returns the subclass of [Solvable] matching the given gamemode.
  factory Solvable.fromMode ({
    Gamemode mode = Gamemode.none,
    int? seed,
  }) {
    switch (mode) {
      case Gamemode.addition:
        return Addition();
      case Gamemode.multiplication:
        return Multiplication();
      case Gamemode.equation:
        return Equation();
      case Gamemode.percentage:
        return Percentage();
      case Gamemode.sale:
        return Sale();
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


/// A mixin to add the ability to handle usual fake values.
///
/// It provides a list of fake solutions and a probability of picking one instead
/// of generating a generic fake solution.
mixin UsualFakes on Solvable {

  /// Some typical mistake people make when solving first degree equations.
  final List<String> usualFakeSolutions = [];

  /// Probability of using a usual fake solution
  double probaOfUsingAnUsualFakeSolution = 0.4;

  @override
  String generateFakeSolution() {
    if (usualFakeSolutions.isNotEmpty
        && random.nextDouble() < probaOfUsingAnUsualFakeSolution
    ) {
      usualFakeSolutions.shuffle();
      final String fakeSolution = usualFakeSolutions.first;
      usualFakeSolutions.removeAt(0);
      return fakeSolution;
    } else {
      return defaultFakeSolution();
    }
  }

  /// Generates a generic fake solution.
  String defaultFakeSolution();

}