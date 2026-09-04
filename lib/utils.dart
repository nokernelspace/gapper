import 'package:flutter/material.dart';

void showSnackBar(BuildContext ctx, String msg) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text(msg),
      // action: SnackBarAction(
      //     label: "Action",
      //     onPressed: () {}
      // ),
      behavior: .floating,
    ),
  );
}
String sanitizeFilename(String name) {
  // Remove/replace characters invalid on any major platform
  final sanitized = name
      .replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1F]'), '_')
      .replaceAll(RegExp(r'\.{2,}'), '_')  // replace consecutive dots
      .trim();

  // Remove leading/trailing dots and spaces (problematic on Windows)
  final trimmed = sanitized.replaceAll(RegExp(r'^[.\s]+|[.\s]+$'), '');

  if (trimmed.isEmpty) return 'unnamed';

  // Windows reserved device names
  final reserved = {
    'CON', 'PRN', 'AUX', 'NUL',
    'COM1','COM2','COM3','COM4','COM5','COM6','COM7','COM8','COM9',
    'LPT1','LPT2','LPT3','LPT4','LPT5','LPT6','LPT7','LPT8','LPT9',
  };

  final base = trimmed.split('.').first.toUpperCase();
  if (reserved.contains(base)) {
    return '_$trimmed';
  }

  /// This is really anoyying to think at on iOS (ㆆ _ ㆆ)
  /// The `Files` app treats the first dot as the extension, not the last dot....
  trimmed.replaceAll(".", "-");
  return trimmed;
}
class Toast extends StatelessWidget {
  Toast({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Showing directly over the FAB!',
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                },
                child: const Text('DISMISS'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
