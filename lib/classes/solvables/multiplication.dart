// Package dependencies
import "package:fraction/fraction.dart";

// Project dependencies
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/utils/globals.dart";

/// In-app representation of an equation `x + a = b`.
class Multiplication extends Solvable with UsualFakes{

  // VARIABLES =================================================================

  /// The value added to `x`.
  late final Fraction _a;

  /// The total value.
  late final Fraction _b;

  /// The unknown value.
  late final Fraction _x;

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  Multiplication() {

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = Fraction(random.nextInt(200) - 100, 10);
    } else {
      _x = Fraction(random.nextInt(20) - 10, 10);
    }

    _a = Fraction(random.nextInt(200) - 100, 10);
    _b = _x * _a;

    // Usual fake solutions

    // When you add instead of dividing.
    usualFakeSolutions.add((_b + _a).autoString());
    // When you subtract instead of dividing.
    usualFakeSolutions.add((_b - _a).autoString());
    // When you divide the wrong numbers.
    usualFakeSolutions.add((_a * _b.inverse()).autoString());

    super.prepare();
  }

  // METHODS ===================================================================

  @override
  String generateQuestion() {
    return "${_a.autoString()} * $randomEmoji = ${_b.autoString()}";
  }

  @override
  String generateSolution() {
    return _x.autoString();
  }

  @override
  String defaultFakeSolution() {
    return Fraction(random.nextInt(200) - 100, 10).autoString();
  }

}