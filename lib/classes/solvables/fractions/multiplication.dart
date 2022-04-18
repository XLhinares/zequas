// Package dependencies
import "package:fraction/fraction.dart";

// Project dependencies
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/utils/globals.dart";

/// In-app representation of an equation `x + a = b`.
class FractionMultiplication extends Solvable with UsualFakes, Fractions {

  // VARIABLES =================================================================

  /// The value added to `x`.
  late final Fraction _a;

  /// The total value.
  late final Fraction _b;

  /// The unknown value.
  late final Fraction _x;

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  FractionMultiplication() {

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = randomFraction(start: -20, end: 20);
    } else {
      _x = randomFraction(start: -20, end: 20);
    }

    _a = randomFraction(start: -20, end: 20);
    _b = _x * _a;

    // Usual fake solutions

    if (_b.denominator + _a.denominator != 0) {
      // When you add instead of dividing.
      usualFakeSolutions.add(Fraction(
          _b.numerator + _a.numerator,
          _b.denominator + _a.denominator
      ).asString());
      // When you subtract instead of dividing.
      usualFakeSolutions.add(Fraction(
          _b.numerator - _a.numerator,
          _b.denominator + _a.denominator
      ).asString());
    }
    // When you divide the wrong numbers.
    usualFakeSolutions.add((_a * _b.inverse()).asString());

    super.prepare();
  }

  // METHODS ===================================================================

  @override
  String generateQuestion() {
    return "${_a.asString()} * $randomVariable = ${_b.asString()}";
  }

  @override
  String generateSolution() {
    return _x.asString();
  }

  @override
  String defaultFakeSolution() {
    return _x.similar.asString();
  }

}