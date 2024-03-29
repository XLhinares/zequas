import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

/// The box in which an answer appears during the game.
///
/// It is a customized [InkContainer]
class AnswerTile extends StatelessWidget {

  // VARIABLES =================================================================

  /// The text to display.
  final String text;

  /// The color of the box.
  final Color? color;

  /// The behavior to execute when tapped on.
  final void Function()? onTap;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [AnswerTile] matching the given parameters.
  const AnswerTile({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return XInkContainer(
      color: color,
      enableSplash: false,
      onTap: onTap,
      child: Text(
          text,
        style: context.textTheme.bodyMedium,
      ),
    );
  }

  // METHODS ===================================================================

}
