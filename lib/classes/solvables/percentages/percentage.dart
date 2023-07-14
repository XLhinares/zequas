import "package:get/get.dart";

import "../solvable.dart";

/// Solvable teaching how to find the percentage of a value.
class Percentage extends Solvable with UsualFakes {

  /// The original value
  late final int value;

  /// The percentage
  late final int percentage;

  /// The result of the operation.
  late final double result;

  /// Returns a new percentage solvable instance.
  Percentage({super.localizationPrefix}) {

    percentage = random.nextInt(100);
    value = random.nextInt(100);
    result = value * percentage / 100;

    probaOfUsingAnUsualFakeSolution = 0.3;
    usualFakeSolutions.add((value + percentage / 100).toStringAsFixed(2));
    usualFakeSolutions.add((value - percentage / 100).toStringAsFixed(2));
    usualFakeSolutions.add(((value - percentage) / 100).toStringAsFixed(2));

    prepare();
  }

  @override
  String defaultFakeSolution() {
    return (result + 0.2 * value * (0.5 - random.nextDouble())).toStringAsFixed(2);
  }

  @override
  String generateQuestion() {
    return "${localizationPrefix}percentage_of".trParams({"percentage": percentage.toString(), "value": value.toString()});
  }

  @override
  String generateSolution() {
    return result.toStringAsFixed(2);
  }

}