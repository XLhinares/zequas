// Flutter dependencies
import "package:flutter_test/flutter_test.dart";

// Project dependencies
import "package:zequas/classes/solvables/equations/addition.dart";
import "package:zequas/classes/solvables/solvable.dart";

void testSolutions () => test(
  "Testing the the solutions are part of the list of possible answers.",
      () async {

    // Expect a "Earn" operation to be counted as positive.
    Solvable addition = EquationAddition();

    expect(addition.possibleSolutions.contains(addition.solution), true);
  },
);