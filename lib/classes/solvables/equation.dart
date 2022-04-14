// Flutter dependencies
import "dart:math";

// Package dependencies
import "package:zequas/classes/solvables/solvable.dart";

/// In-app representation of a first-degree equation `a * x + b = c`.
class Equation extends Solvable{

  // VARIABLES =================================================================

  /// The random used to generate numbers.
  late final Random random;

  /// The value multiplying `x`.
  late final double _a;

  /// The value added to `a * x`.
  late final double _b;

  /// The total value.
  late final double _c;

  /// The unknown value.
  late final double _x;
  
  /// Some typical mistake people make when solving first degree equations.
  final List<String> usualFakeSolutions = [];

  /// Probability of using a usual fake solution
  final _probaOfUsingAnUsualFakeSolution = 0.7;

  // CONSTRUCTOR ===============================================================

  /// Returns the equation with its computed answer and string values.
  Equation({int? seed}) {
    
    maxFakeSolutions = -1;
    
    random = Random(seed);

    // Most of the time X is an integer, however there is a chance it's a double.
    if (random.nextDouble() < 0.25) {
      _x = random.nextInt(20) - 10 + random.nextInt(10)/10;
    } else {
      _x = random.nextInt(20) - 10;
    }

    _a = random.nextInt(20) - 10 + random.nextInt(10)/10;
    _b = random.nextInt(20) - 10 + random.nextInt(10)/10;
    _c = ((_a * _x + _b) * 100).roundToDouble() / 100;
    
    // Usual fake solutions

    // When you try the division first.
    usualFakeSolutions.add(doubleOrFraction(a: _c - _b * _a, b: _a));
    // When you add instead of subtracting.
    usualFakeSolutions.add(doubleOrFraction(a: _c + _b, b: _a));
    // When you multiply instead of dividing.
    usualFakeSolutions.add(doubleOrFraction(a: _a * (_c + _b), b: 1));

    super.prepare();
  }

  // METHODS ===================================================================

  /// Returns a fraction as a string containing either a number or a fraction.
  ///
  /// If the original fraction can be written as a number with one decimal or less,
  /// then that number is returned, otherwise the fraction is returned.
  String doubleOrFraction({required double a, required double b}) {

    a = (a * 100).roundToDouble() / 100;
    b = (b * 100).roundToDouble() / 100;

    if (a / b == (a / b).truncateToDouble()) {
      return "${(a / b * 100).roundToDouble() / 100}";
    } else {
      if (a * b > 0) {
        return "$a / $b";
      } else {
        return"- ${a.abs()} / ${b.abs()}";
      }
    }
  }
  
  @override
  String generateFakeSolution() {
    if (usualFakeSolutions.isNotEmpty
        && random.nextDouble() < _probaOfUsingAnUsualFakeSolution
    ) {
      usualFakeSolutions.shuffle();
      final String fakeSolution = usualFakeSolutions.first;
      usualFakeSolutions.removeAt(0);
      return fakeSolution;
    } else {
    return "${random.nextInt(200)/10 - 10}";
    }
  }

  @override
  String generateQuestion() {
    if (_b < 0) {
      return "$_a * x - ${_b * -1} = $_c";
    } else {
      return "$_a * x + $_b = $_c";
    }
  }

  @override
  String generateSolution() {
    return "$_x";
  }

}