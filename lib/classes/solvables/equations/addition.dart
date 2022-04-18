// Package dependencies
import "package:fraction/fraction.dart";

// Project dependencies
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/utils/globals.dart";

/// In-app representation of an equation `x + a = b`.
class EquationAddition extends Solvable with UsualFakes, Decimals{

  // VARIABLES =================================================================

  /// The value added to `x`.
  late final Fraction _a;

  /// The total value.
  late final Fraction _b;

  /// The unknown value.
  late final Fraction _x;

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  EquationAddition() {

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = randomDecimalFraction(start: -10, end: 10, decimals: 1);
    } else {
      _x = randomDecimalFraction(start: -10, end: 10, decimals: 0);
    }

    _a = randomDecimalFraction(start: -10, end: 10, decimals: 1);
    _b = _x + _a;

    // Usual fake solutions

    // When you add instead of subtracting.
    usualFakeSolutions.add((_b + _a).asString(allowedDecimals: 1, forceDouble: true));
    // When you multiply instead of subtracting.
    usualFakeSolutions.add((_b * _a).asString(allowedDecimals: 1, forceDouble: true));

    super.prepare();
  }

  // METHODS ===================================================================

  @override
  String generateQuestion() {
    return "${_a.asString(allowedDecimals: 1)} + $randomVariable = ${_b.asString(allowedDecimals: 1)}";
  }

  @override
  String generateSolution() {
    return _x.asString(allowedDecimals: 2);
  }

  @override
  String defaultFakeSolution() {
    return _x.similar.asString(
      allowedDecimals: 1,
      forceDouble: true,
    );
  }

}