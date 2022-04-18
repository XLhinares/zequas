import 'dart:math';

/// Archive of a turn to store stats.
class ArchivedTurn {

  // VARIABLES =================================================================

  /// The question that was asked during that turn.
  final String question;

  /// The answer that was expected during that turn.
  final String solution;

  /// The number of attempts it took for the user to find the solution.
  late int _attempts;

  /// The time at which the turn started (in milliseconds since Epoch)
  int? _timeStart;

  /// The time at which the turn ended (in milliseconds since Epoch)
  int? _timeEnd;

  // GETTERS ===================================================================

  /// The number of attempts it took for the user to find the solution.
  int get attempts => _attempts;

  /// The duration of the turn in ms or 0 if the turn didn't happen.
  int get duration => _timeStart == null || _timeEnd == null
      ? 0
      : _timeEnd! - _timeStart!;

  /// The number of points earned during that turn
  int get points {
    if (_attempts <= 0) {
      // The question wasn't answered, no points given.
      return 0;
    } else if (_attempts <= 1) {
      // Add 5 point below 1 try.
      return 5;
    } else if (_attempts <= 2) {
      // Add 3 point below 2 attempts.
      return 3;
    } else if (_attempts <= 3) {
      // Add 2 point below 3 attempts.
      return 2;
    } else if (_attempts <= 5) {
      // Add 1 point below 5 attempts
      return 1;
    } else {
      // Don't add point above 6 attempts.
      return 0;
    }
  }

  /// The score the user earned with that turn.
  int get score {
    // If there were no attempts or the duration is unknown, the score is 0.
    if (duration == 0 || attempts == 0) return 0;

    // `* 10000`    to get big numbers
    // `log`        so that the score doesn't go down too fast from taking longer
    // `+ 1`        so that the log always exists
    // `* attempts` to penalise too many attempts
    // `/ 1000`     to account for the duration in milliseconds
    return 10000 ~/ log(1 + duration * attempts / 1000);
  }

  // CONSTRUCTOR ===============================================================

  /// Returns the instance of [ArchivedTurn] matching the given parameters.
  ArchivedTurn({
    required this.question,
    required this.solution,
  }) {
    _attempts = 0;
  }

  // METHODS ===================================================================

  ///
  void newAttempt () => _attempts++;

  /// Registers the time at which the turn started.
  void start () => _timeStart = DateTime.now().millisecondsSinceEpoch;

  /// Registers the time at which the turn ended.
  void end () => _timeEnd = DateTime.now().millisecondsSinceEpoch;

}