import "package:zequas/classes/solvables/solvable.dart";

/// A fake implementation for testing purposes.
class TestSolvable extends Solvable {

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [TestSolvable].
  TestSolvable() {
    maxFakeSolutions = -1;
    super.prepare();
  }

  // METHODS ===================================================================

  @override
  String generateFakeSolution() {
    return "Fake solution";
  }

  @override
  String generateQuestion() {
    return "a * x + b = c";
  }

  @override
  String generateSolution() {
    return "x = (c - b) / a";
  }
}