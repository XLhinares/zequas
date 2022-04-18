// Flutter dependencies
import "dart:math";

// Package dependencies
import "package:fraction/fraction.dart";

// Project dependencies
import "package:zequas/classes/solvables/solvable.dart";

// USUAL FAKES =================================================================

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

// DECIMALS ====================================================================

/// A mixin to provide unified DecimalFraction generation to Solvable instances.
mixin Decimals on Solvable {

  /// Return a random Fraction
  Fraction randomDecimalFraction({
    int start = 0,
    required int end,
    int decimals = 0,
    bool canBeZero = false,
  }) {

    int scale = pow(10, decimals).toInt();
    int numerator = random.nextInt((end - start) * scale) + start * scale;

    // If the numerator is 0 but isn't allowed to be, we reroll it.
    while (numerator == 0 && !canBeZero) {
      numerator = random.nextInt((end - start) * scale) + start * scale;
    }
    return Fraction(numerator, scale);
  }
}

// FRACTIONS ===================================================================

/// A mixin to provide unified Fractions generation to Solvable instances.
mixin Fractions on Solvable {

  /// Return a random Fraction
  Fraction randomFraction({
    int start = 0,
    required int end,
    bool canBeZero = false,
  }) {
    final Random random = Random();

    int numerator = random.nextInt((end - start)) + start;
    while (numerator == 0 && !canBeZero) {
      numerator = random.nextInt((end - start)) + start;
    }

    int denominator = 0;
    while (denominator == 0) {
      denominator = random.nextInt((end - start)) + start;
    }

    return Fraction(numerator, denominator);
  }
}

/// An extension on Fraction to make them easier to use within solvables.
extension SolvableFraction on Fraction {

  /// Returns a fraction that's similar to the given fraction.
  ///
  /// The new fraction can NOT be equal to the original one.
  Fraction get similar {

    Random random = Random();

    // Making sure the fake denominator isn't 0.
    int fakeDenominator = 0;
    while (fakeDenominator == 0) {
      fakeDenominator = denominator + random.nextInt(10) - 5;
    }

    int fakeNumerator = numerator + random.nextInt(20) - 10;
    while (Fraction(fakeNumerator, fakeDenominator) == this){
      fakeNumerator = numerator + random.nextInt(20) - 10;
    }

    return Fraction(
      fakeNumerator,
      fakeDenominator,
    );
  }

  /// Returns a string matching the fraction.
  ///
  /// The function features two arguments
  /// - [allowedDecimals]: the fraction will be converted to a double if it has
  /// less decimals than allowed. If set to -1, the fraction will never be
  /// converted.
  /// - [forceDouble]: whether the result should absolutely be a double. The number
  /// of decimals will still match [allowedDecimals] if it's greater than 0.
  /// - [reduce]: if true, the fraction will be reduced before being returned.
  String asString ({
    int allowedDecimals = -1,
    bool forceDouble = false,
    bool reduce = false,
  }) {

    if (forceDouble) {
      return allowedDecimals > -1
          ? toDouble().toStringAsFixed(allowedDecimals)
          : toDouble().toString();
    }

    final value = reduce ? this.reduce() : this;
    final double allowedError = pow(10, -(10 - allowedDecimals)).toDouble();
    final double boostedValue = pow(10, allowedDecimals).toDouble() * toDouble();

    if (allowedDecimals > -1
        && ((boostedValue - boostedValue.truncateToDouble()).abs() < allowedError)
    ) {
      // print("printing ${toDouble()} instead of $this");
      return toDouble().toStringAsFixed(allowedDecimals);
    } else {
      return value.toString();
    }
  }

}