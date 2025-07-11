import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final String label;

  const DownloadButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Icon(Icons.download),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Downloading $label...')));
        // TODO: Add real download logic
      },
    );
  }
}
