import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../tabs/settings.dart";
import "../../utils/extensions.dart";
import "../../utils/globals.dart";
import "background.dart";
import "frame_fit.dart";

/// A Scaffold that fits its body within a central column if needed.
class ScaffoldFit extends StatelessWidget {
  // VARIABLES =================================================================

  /// An optional widget to display in the background.
  final Widget? background;

  /// An optional widget to display over the main child.
  ///
  /// It should be carefully be positioned.
  /// This can be used for floating buttons.
  final Widget? overlay;

  /// An optional bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// An optional drawer.
  final Widget? drawer;

  /// The widget we want to display within the frame.
  final Widget body;

  /// The space that should surround the child.
  final EdgeInsets? padding;

  /// The ratio of the horizontal extent over the vertical.
  final double aspectRatio;

  /// How the child should be aligned in the frame.
  final AlignmentGeometry alignment;

  /// An optional title to display in the appbar.
  final String? title;

  /// Whether to show the appbar at all.
  final bool showAppbar;

  /// Whether to show the back button on the app bar.
  ///
  /// Cannot coexist with the "drawer" button.
  final bool appbarShowBack;

  /// An optional function controlling the behavior of the "back" button of the appbar.
  /// Defaults to [Get.back]
  final void Function()? appbarBackBehavior;

  /// Whether to show the "open drawer" button on the app bar.
  ///
  /// Cannot coexist with the "back" button.
  final bool appbarShowDrawer;

  /// Whether to show the settings button on the app bar.
  final bool appbarShowSettings;

  /// A list of custom actions to show in the appbar.
  final List<Widget>? appbarActions;

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [ScaffoldFit] matching the given parameters.
  const ScaffoldFit({
    super.key,
    required this.body,
    this.background,
    this.overlay,
    this.bottomNavigationBar,
    this.drawer,
    this.padding,
    this.aspectRatio = frameRatioMobile,
    this.alignment = Alignment.center,
    this.title,
    this.showAppbar = true,
    this.appbarShowBack = false,
    this.appbarShowDrawer = false,
    this.appbarShowSettings = false,
    this.appbarBackBehavior,
    this.appbarActions,
  });

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppbar
          ? AppBar(
              title: Text(title ?? "app_name".tr),
              automaticallyImplyLeading: false,
              leading: _leading(context),
              actions: [
                if (appbarActions != null) ...appbarActions!,
                if (appbarShowSettings)
                  IconButton(
                    onPressed: () => Get.to(() => const TabSettings()),
                    icon: Icon(
                      Icons.settings,
                      color: context.colors.onSecondary,
                    ),
                  ),
                XLayout.horizontalS,
              ],
            )
          : null,
      body: FrameFit(
        padding: padding,
        background: background ?? const ScaffoldBackground(),
        overlay: overlay,
        aspectRatio: aspectRatio,
        alignment: alignment,
        child: body,
      ),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  // METHODS ===================================================================

  Widget? _leading(BuildContext context) {
    assert(!appbarShowBack || !appbarShowDrawer,
        "Cannot both show the back and the drawer button on the appbar!");

    if (appbarShowBack) {
      return IconButton(
        onPressed: appbarBackBehavior ?? () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: context.colors.onSecondary,
        ),
      );
    }
    if (appbarShowDrawer) {
      return Builder(builder: (context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: context.colors.onSecondary,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      });
    }

    return null;
  }
}
