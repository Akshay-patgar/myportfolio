import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchHelper {
  LaunchHelper._();

  static Future<void> launch(String url, {BuildContext? context}) async {
    final Uri uri = Uri.parse(url);
    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context != null && context.mounted) {
        _showError(context, 'Could not open $url');
      }
    } catch (_) {
      if (context != null && context.mounted) {
        _showError(context, 'Could not open $url');
      }
    }
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}
