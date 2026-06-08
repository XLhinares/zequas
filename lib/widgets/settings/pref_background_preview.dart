import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../classes/dataclasses/background_data.dart";
import "../../utils/extensions.dart";
import "../../utils/globals.dart";

/// A widget allowing the user to preview a theme.
class BackgroundPreview extends StatelessWidget {
  // VARIABLES =================================================================

  /// The contents of the theme being previewed.
  final BackgroundData data;

  // CONSTRUCTOR ===============================================================

  /// Returns a [BackgroundPreview] matching the given parameters.
  const BackgroundPreview(
    this.data, {
    super.key,
  });

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: XLayout.brcXS,
      child: Obx(() => XButton(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            borderDecoration: app.cookies.background.value == data.name
                ? Border.all(width: 2, color: context.colors.secondary)
                : null,
            color: context.colors.surface,
            onTap: () => app.cookies.background.value = data.name,
            child: Stack(
              children: [
                Positioned.fill(
                    child: data.preview(context) ?? const SizedBox()),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: context.theme.colorScheme.surface.withAlpha(100),
                    padding: EdgeInsets.all(XLayout.paddingXS),
                    child: Center(
                        child: AutoSizeText(
                      "background_${data.name}".tr,
                      style: context.bodyMediumOnSurface,
                      maxLines: 1,
                    )),
                  ),
                )
              ],
            ),
          )),
    );
  }

// WIDGETS ===================================================================
}
