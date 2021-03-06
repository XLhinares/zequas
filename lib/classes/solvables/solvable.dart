// Flutter dependencies
import "dart:math";

// Project dependencies
import "package:zequas/classes/gamemode.dart";
import "package:zequas/classes/solvables/equations/addition.dart";
import "package:zequas/classes/solvables/equations/equation.dart";
import "package:zequas/classes/solvables/equations/multiplication.dart";
import "package:zequas/classes/solvables/fractions/addition.dart";
import "package:zequas/classes/solvables/fractions/equation.dart";
import "package:zequas/classes/solvables/fractions/multiplication.dart";
import "package:zequas/classes/solvables/percentages/percentage.dart";
import "package:zequas/classes/solvables/percentages/sale.dart";
import "package:zequas/classes/solvables/test.dart";
import "package:zequas/utils/globals.dart";

export "mixins.dart";

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

  /// The probability that the right solution is not among the answers.
  ///
  /// In this case, a "None of the answers" button is displayed.
  double probaNoSolution = 0.1;

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
    // FRACTION --------------------------------------------------------------
      case Gamemode.fractionAddition:
        return FractionAddition();
      case Gamemode.fractionMultiplication:
        return FractionMultiplication();
      case Gamemode.fractionAll:
        return FractionEquation();
    // EQUATION --------------------------------------------------------------
      case Gamemode.equationAddition:
        return EquationAddition();
      case Gamemode.equationMultiplication:
        return EquationMultiplication();
      case Gamemode.equationAll:
        return EquationFull();
    // PERCENTAGE ------------------------------------------------------------
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

    final bool noAnswer = random.nextDouble() < probaNoSolution;
    if (noAnswer) {
      solution = "Aucun des autres choix";
    } else {
      solution = generateSolution();
    }

    possibleSolutions.add(solution);

    // If not in the "no answer" case, there's a chance the "no answer" appears
    // as a fake solution.
    // It has the same chance to appear as a fake solution than as the right
    // solution so that the "no answer" stays balanced.
    if (!noAnswer && random.nextDouble() < probaNoSolution) {
      possibleSolutions.add("Aucun des autres choix");
    }

    int remainingFakeSolutions = fakeSolutionsLength - possibleSolutions.length + 1;
    for (int i = 0 ; i < remainingFakeSolutions ; i++) {
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
