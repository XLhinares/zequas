import "package:flutter/material.dart";
import "package:flutter_typeahead/flutter_typeahead.dart";
import "package:get/get.dart";
import "package:x_containers/x_containers.dart";

import "../../utils/globals.dart";

/// The settings allowing the user to set the locale of the app.
class SettingsLocale extends StatelessWidget {
  // VARIABLES =================================================================

  final TextEditingController _controller = TextEditingController(
    text: settings.locale.value,
  );

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsLocale] matching the given parameters.
  SettingsLocale({Key? key}) : super(key: key);

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.2,
        // height: (context.textTheme.bodyMedium?.height ?? XLayout.paddingM) * 1.5 ,
        child: XContainer(
          enableShadow: false,
          color: context.theme.colorScheme.background,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: TypeAheadFormField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: XLayout.paddingS),
                fillColor: Colors.transparent,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            suggestionsCallback: (pattern) {
              List<String> res = List.from(
                supportedLocales.where(
                      (element) => element.contains(pattern),
                ),
              );

              if (res.isEmpty) return supportedLocales;

              // If there's only one known locale matching,
              // the whole list is returned.
              if (res.length == 1 && res[0] == pattern) return supportedLocales;

              return res;
            },
            itemBuilder: (context, itemData) => XListTile(
              title: Text(
                itemData,
                style: context.textTheme.bodyMedium,
              ),
              margin: EdgeInsets.all(XLayout.paddingS),
            ),
            onSuggestionSelected: (suggestion) {
              _controller.text = suggestion;
              settings.locale.value = suggestion;
            },
          ),
        ),
    );
  }

// METHODS ===================================================================
}
