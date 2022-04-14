// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:x_containers/x_containers.dart";

/// The box in which an answer appears during the game.
///
/// It is a customized [InkContainer]
class AnswerContainer extends StatelessWidget {

  // VARIABLES =================================================================

  /// The text to display.
  final String text;

  /// The color of the box.
  final Color? color;

  /// The behavior to execute when tapped on.
  final void Function()? onTap;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [AnswerContainer] matching the given parameters.
  const AnswerContainer({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return InkContainer(
      color: color,
      enableSplash: false,
      onTap: onTap,
      child: Text(text),
    );
  }

  // METHODS ===================================================================

}
