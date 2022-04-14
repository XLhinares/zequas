// Flutter dependencies
import "package:flutter/material.dart";

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