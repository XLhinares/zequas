// Package dependencies
import "dart:math";

import "package:flutter/material.dart";
import "package:fraction/fraction.dart";

// Project dependencies
import "package:zequas/classes/game.dart";
import "package:zequas/classes/settings.dart";
import "package:zequas/classes/user.dart";

// SINGLETONS ==================================================================

/// The user of the app.
User user = User();

/// In-app representation of the game being played.
Game game = Game();

/// The saved settings.
Settings settings = Settings();

// COLOR SCHEME ================================================================

/// The primary color of the app.
Color cPrimary = const Color(0xFF262031);

/// The secondary color of the app.
Color cSecondary = const Color(0xFF697eb6);

// FUNCTIONS ===================================================================

/// An extension on the [Fraction] class to display decimal strings instead of
/// simple fractions.
extension AutoString on Fraction {

  /// Returns a string instead of a simple fraction if possible, and a regular
  /// fraction otherwise.
  String autoString ({int allowedDecimals = 2}) {
    final double allowedError = pow(10, -(10 - allowedDecimals)).toDouble();
    final double boostedValue = pow(10, allowedDecimals).toDouble() * toDouble();
    if ((boostedValue - boostedValue.truncateToDouble()).abs() < allowedError) {
      print("printing ${toDouble()} instead of $this");
      return toDouble().toString();
    } else {
      return reduce().toString();
    }
  }
}