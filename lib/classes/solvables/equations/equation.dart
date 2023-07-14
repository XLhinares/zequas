import "package:fraction/fraction.dart";

import "../../../utils/utils.dart";
import "../solvable.dart";

/// In-app representation of a first-degree equation `a * x + b = c`.
class EquationFull extends Solvable with UsualFakes, Decimals {

  // VARIABLES =================================================================

  /// The value multiplying `x`.
  late final Fraction _a;
  String get _as => _a.asString(allowedDecimals: 2);

  /// The value added to `a * x`.
  late final Fraction _b;
  String get _bs => _b.asString(allowedDecimals: 2);

  /// The total value.
  late final Fraction _c;
  String get _cs => _c.asString(allowedDecimals: 2);

  /// The unknown value.
  late final Fraction _x;
  String get _xs => _x.asString(allowedDecimals: 2);

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  EquationFull() {

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = randomDecimalFraction(start: -10, end: 10, decimals: 1);
    } else {
      _x = randomDecimalFraction(start: -10, end: 10, decimals: 0);
    }

    _a = randomDecimalFraction(start: -10, end: 10, decimals: 1);
    _b = randomDecimalFraction(start: -10, end: 10, decimals: 1);
    _c = _a * _x + _b;

    // Usual fake solutions

    // When you try the division first.
    usualFakeSolutions.add(((_c - _b * _a) / _a).asString(allowedDecimals: 2));
    // When you add instead of subtracting.
    usualFakeSolutions.add(((_c + _b) / _a).asString(allowedDecimals: 2));
    // When you multiply instead of dividing.
    usualFakeSolutions.add((_a * (_c + _b)).asString(allowedDecimals: 2));

    super.prepare();
  }

  // METHODS ===================================================================


  @override
  String generateQuestion() {
    if (_b.toDouble() < 0) {
      return "$_as * $randomVariable - ${_b.negate().asString(allowedDecimals: 2)} = $_cs";
    } else {
      return "$_as * $randomVariable + $_bs = $_cs";
    }
  }

  @override
  String generateSolution() {
    return _xs;
  }

  @override
  String defaultFakeSolution() {
    return _x.similar.asString(
      allowedDecimals: 2,
      forceDouble: true,
    );
  }

}