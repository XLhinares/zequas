import "package:get/get.dart";

import "../solvable.dart";

/// Solvable teaching how to find the percentage of a value.
class Sale extends Solvable with UsualFakes {

  /// The type of sale, 0 for price reduction, 1 for price increase.
  late final int type;

  /// The original value
  late final int value;

  /// The percentage
  late final int percentage;

  /// The result of the operation.
  late final double result;

  /// Returns a new percentage solvable instance.
  Sale({super.localizationPrefix}) {

    type = random.nextInt(1);
    percentage = random.nextInt(50);
    value = random.nextInt(100);
    result = value * (1 + [-1, 1][type] * percentage / 100);

    probaOfUsingAnUsualFakeSolution = 0.7;
    usualFakeSolutions.add((value * (1 + [1, -1][type] * percentage / 100)).toStringAsFixed(2));

    prepare();
  }

  @override
  String defaultFakeSolution() {
    return (result + 0.2 * value * (0.5 - random.nextDouble())).toStringAsFixed(2);
  }

  @override
  String generateQuestion() {
    return "$localizationPrefix${["sales_down", "sales_up"][type]}".trParams({"value": value.toString(), "percentage": percentage.toString()});
  }

  @override
  String generateSolution() {
    return result.toStringAsFixed(2);
  }

}