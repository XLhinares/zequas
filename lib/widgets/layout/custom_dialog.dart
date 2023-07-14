// Flutter dependencies
import "dart:ui";
import "package:flutter/material.dart";

// Package dependencies
import "package:get/get.dart";

/// A custom [AlertDialog]
class CustomDialog extends StatelessWidget {

  // VARIABLES =================================================================

  /// The text to display at the top of the dialog.
  final String title;

  /// The description of the effect of the dialog.
  final String message;

  /// The text displayed on the cancel button.
  ///
  /// If it is [null] then the button isn't displayed.
  final String? cancelText;

  /// The text displayed on the validate button.
  ///
  /// If it is [null] then the button isn't displayed.
  final String? validateText;

  /// The behavior to execute when the "cancel" button is pressed.
  ///
  /// It isn't optimal to rely on it as the user may close the dialog by tapping
  /// outside the box.
  final void Function()? onCancel;

  /// The behavior to execute when the "validate" button is pressed.
  final void Function()? onValidate;

  /// The intensity of the gaussian blur applied to the background.
  ///
  /// [0] means no blurring.
  final double backgroundBlur;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [CustomDialog] matching the given parameters.
  const CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    this.cancelText = "Cancel",
    this.validateText = "Okay",
    this.onCancel,
    this.onValidate,
    this.backgroundBlur = 0,
  }) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: backgroundBlur,
        sigmaY: backgroundBlur,
      ),
      child: AlertDialog(
        title: Text(
          title,
        style: context.textTheme.titleSmall!
        ),
        content: Text(
          message,
          style: context.textTheme.bodyMedium!
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
              onCancel?.call();
            },
            child: Text(cancelText ?? "Cancel"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              onValidate?.call();
            },
            child: Text(validateText ?? "Okay"),
          ),
        ],
      ),
    );
  }

// METHODS ===================================================================

}
