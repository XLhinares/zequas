import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:url_launcher/url_launcher.dart";
import "package:x_containers/x_containers.dart";

import "settings.dart";

/// A [SettingsRow] to let the user know about my BuyMeACoffee.
class SettingsCreditsBMAC extends StatelessWidget {

  // VARIABLES =================================================================

  final Uri _url = Uri.parse("https://www.buymeacoffee.com/xeppelin");

  // CONSTRUCTOR ===============================================================

  /// Returns an instance of [SettingsCreditsBMAC] matching the given parameters.
  SettingsCreditsBMAC({super.key,});

  // BUILD =====================================================================

  @override
  Widget build(BuildContext context) {
    return SettingsRow(
      name: "settings_credits_bmac".tr,
      description: "settings_credits_bmac_desc".tr,
      actions: [
        XInkContainer(
          color: context.theme.colorScheme.secondary,
          padding: EdgeInsets.all(XLayout.paddingS),
          onTap: _launchUrl,
          child: const Icon(Icons.exit_to_app,),
        ),
      ],
    );
  }

  // METHODS ===================================================================

  Future<void> _launchUrl () async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch [$_url]");
    }
  }

}
