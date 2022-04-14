// Flutter dependencies
import "package:flutter/material.dart";

/// Extra-small padding value.
const double paddingXS = 5;
/// Small padding value.
const double paddingS = 10;
/// Medium padding value.
const double paddingM = 25;
/// Large padding value.
const double paddingL = 50;

/// A static class to store the main possible shapes.
class ContainerShape {

  // BORDER RADIUS =============================================================

  /// Extra-small circular border radius
  static final BorderRadius brcXS = BorderRadius.circular(paddingXS);
  /// Small circular border radius
  static final BorderRadius brcS = BorderRadius.circular(paddingS);
  /// Medium circular border radius
  static final BorderRadius brcM = BorderRadius.circular(paddingM);
  /// Large circular border radius
  static final BorderRadius brcL = BorderRadius.circular(paddingL);
  /// Circular border radius
  static final BorderRadius brcX = BorderRadius.circular(1000);

}


/// A static class to store all space related constants
class Space {

  // Values ====================================================================


  // SIZED BOXES ===============================================================

  // Horizontal ----------------------------------------------------------------

  /// Extra-small horizontal [SizedBox].
  static const SizedBox horizontalXS = SizedBox(width: paddingXS);
  /// Small horizontal [SizedBox].
  static const SizedBox horizontalS = SizedBox(width: paddingS);
  /// Medium horizontal [SizedBox].
  static const SizedBox horizontalM = SizedBox(width: paddingM);
  /// Large horizontal [SizedBox].
  static const SizedBox horizontalL = SizedBox(width: paddingL);

  // Vertical ------------------------------------------------------------------

  /// Extra-small vertical [SizedBox].
  static const SizedBox verticalXS = SizedBox(height: paddingXS);
  /// Small vertical [SizedBox].
  static const SizedBox verticalS = SizedBox(height: paddingS);
  /// Medium vertical [SizedBox].
  static const SizedBox verticalM = SizedBox(height: paddingM);
  /// Large vertical [SizedBox].
  static const SizedBox verticalL = SizedBox(height: paddingL);

}