import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../utils/globals.dart";
import "settings_tile.dart";

/// The settings allowing the user to set the locale of the app.
class SettingsLocale extends StatelessWidget {
  // VARIABLES =================================================================

  // final TextEditingController _controller = TextEditingController(
  //   text: app.cookies.locale.value,
  // );

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsLocale] matching the given parameters.
  const SettingsLocale({super.key});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SettingsTile.rotator(
      title: "settings_locale_rotator".trParams({
        "value": "language_${app.cookies.locale.value}".tr,
      }),
      description: "settings_locale_desc".tr,
      onTapLeft: app.cookies.rotateLocaleL,
      onTapRight: app.cookies.rotateLocaleR,
    );
  }

  // // Build with [TypeAheadField].
  //
  // @override
  // Widget build(BuildContext context) {
  //   return SettingsTile.actions(
  //     title: "settings_locale".tr,
  //     description: "settings_locale_desc".tr,
  //     actions: [
  //       SizedBox(
  //         width: XLayout.paddingL * 3,
  //         child: PresetTypeAheadField<String>(
  //           controller: _controller,
  //           style: context.textTheme.bodyMedium!.copyWith(
  //             color: context.colors.onSurface,
  //             fontFeatures: [const FontFeature.enable("smcp")],
  //           ),
  //           backgroundColor: context.colors.surface,
  //           enableShadow: false,
  //           choices: supportedLocales,
  //           onSuggestionSelected: (suggestion) {
  //             _controller.text = suggestion;
  //             app.cookies.locale.value = suggestion;
  //           },
  //           suggestionsCallback: (pattern) {
  //             List<String> res = List.from(
  //               supportedLocales.where((element) => element.contains(pattern)),
  //             );

  //             if (res.isEmpty) return supportedLocales;

  //             // If there's only one known locale matching,
  //             // the whole list is returned.
  //             if (res.length == 1 && res[0] == pattern) return supportedLocales;

  //             return res;
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // METHODS ===================================================================
}
