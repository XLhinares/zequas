// Flutter dependencies
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";

/// A widget to that fit all its child within a central column if needed.
class FrameFit extends StatelessWidget {

  // VARIABLES =================================================================

  /// The widget we want to display within the frame.
  final Widget child;

  /// The space that should surround the child.
  final EdgeInsets? padding;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [FrameFit] matching the given parameters.
  const FrameFit({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.height * 0.6,
          ),
          child: child,
        ),
      ),
    );
  }

}
