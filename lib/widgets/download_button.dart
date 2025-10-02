import 'package:flutter/material.dart';
import '../utils/url_launcher_helper.dart';

class DownloadButton extends StatelessWidget {
  final String label;
  final String url;

  const DownloadButton({super.key, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => UrlLauncherHelper.openUrl(url),
      icon: const Icon(Icons.open_in_new),
      label: Text(label),
    );
  }
}
// TODO Implement this library.
