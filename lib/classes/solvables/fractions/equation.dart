// Package dependencies
import "package:fraction/fraction.dart";
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/utils/globals.dart";

/// In-app representation of a first-degree equation `a * x + b = c`.
class FractionEquation extends Solvable with UsualFakes, Fractions {

  // VARIABLES =================================================================

  /// The value multiplying `x`.
  late final Fraction _a;
  String get _as => _a.asString();

  /// The value added to `a * x`.
  late final Fraction _b;
  String get _bs => _b.asString();

  /// The total value.
  late final Fraction _c;
  String get _cs => _c.asString();

  /// The unknown value.
  late final Fraction _x;
  String get _xs => _x.asString();

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  FractionEquation() {

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = randomFraction(start: -20, end: 20);
    } else {
      _x = randomFraction(start: -20, end: 20);
    }

    _a = randomFraction(start: -20, end: 20);
    _b = randomFraction(start: -20, end: 20);
    _c = _a * _x + _b;

    // Usual fake solutions

    // When you try the division first.
    usualFakeSolutions.add(((_c - _b * _a) / _a).asString());
    // When you add instead of subtracting.
    usualFakeSolutions.add(((_c + _b) / _a).asString());
    // When you multiply instead of dividing.
    usualFakeSolutions.add((_a * (_c + _b)).asString());

    super.prepare();
  }

  // METHODS ===================================================================


  @override
  String generateQuestion() {
    if (_b.toDouble() < 0) {
      return "$_as * $randomEmoji - ${_b.negate().asString()} = $_cs";
    } else {
      return "$_as * $randomEmoji + $_bs = $_cs";
    }
  }

  @override
  String generateSolution() {
    return _xs;
  }

  @override
  String defaultFakeSolution() {
    return _x.similar.asString();
  }

}