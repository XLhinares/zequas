// Package dependencies
import "package:fraction/fraction.dart";
import "package:zequas/classes/solvables/solvable.dart";
import "package:zequas/utils/globals.dart";

/// In-app representation of a first-degree equation `a * x + b = c`.
class Equation extends Solvable with UsualFakes {

  // VARIABLES =================================================================

  /// The value multiplying `x`.
  late final Fraction _a;
  String get _as => _a.autoString();

  /// The value added to `a * x`.
  late final Fraction _b;
  String get _bs => _b.autoString();

  /// The total value.
  late final Fraction _c;
  String get _cs => _c.autoString();

  /// The unknown value.
  late final Fraction _x;
  String get _xs => _x.autoString();

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  Equation() {

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = Fraction(random.nextInt(200) - 100, 10);
    } else {
      _x = Fraction(random.nextInt(20) - 10, 1);
    }

    _a = Fraction(random.nextInt(200) - 100, 10);
    _b = Fraction(random.nextInt(200) - 100, 10);
    _c = _a * _x + _b;

    // Usual fake solutions

    // When you try the division first.
    usualFakeSolutions.add(((_c - _b * _a) / _a).autoString());
    // When you add instead of subtracting.
    usualFakeSolutions.add(((_c + _b) / _a).autoString());
    // When you multiply instead of dividing.
    usualFakeSolutions.add((_a * (_c + _b)).autoString());

    super.prepare();
  }

  // METHODS ===================================================================


  @override
  String generateQuestion() {
    if (_b.toDouble() < 0) {
      return "$_as * $randomEmoji - ${_b.negate().autoString()} = $_cs";
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
    return Fraction(random.nextInt(200) - 100, 10).autoString();
  }

}