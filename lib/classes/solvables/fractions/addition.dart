import "package:fraction/fraction.dart";

import "../solvable.dart";
import "../../../utils/globals.dart";

/// In-app representation of an addition of fractions `a + b = x`.
class FractionAddition extends Solvable with UsualFakes, Fractions {

  // VARIABLES =================================================================

  /// The value added to `x`.
  late final Fraction _a;

  /// The total value.
  late final Fraction _b;

  /// The unknown value.
  late final Fraction _x;

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  FractionAddition() {

    _a = randomFraction(start: -20, end: 20);
    _b = randomFraction(start: -20, end: 20);
    _x = _a + _b;

    // Usual fake solutions

    usualFakeSolutions.add(Fraction(_a.numerator + _b.numerator, _x.denominator).toString());
    // When you multiply instead of adding.
    usualFakeSolutions.add((_b * _a).toString());

    super.prepare();
  }

  // METHODS ===================================================================

  @override
  String generateQuestion() {
    if (_b.toDouble() < 0) {
      return "${_a.toString()} - ${_b.negate().toString()} = $randomVariable";
    } else {
      return "${_a.toString()} + ${_b.toString()} = $randomVariable";
    }
  }

  @override
  String generateSolution() {
    return _x.toString();
  }

  @override
  String defaultFakeSolution() {
    return _x.similar.asString();
  }

}