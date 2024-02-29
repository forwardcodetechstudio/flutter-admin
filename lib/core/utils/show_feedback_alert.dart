import 'package:flutter/material.dart';

Future<bool> showFeedBackAlert({
  required BuildContext context,
  required String text,
  required String title,
  String? buttonText,
  Color? buttonForegroundColor,
  Color? buttonBackgroundColor,
}) async {
  final response = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonBackgroundColor ?? Colors.blue,
              foregroundColor: buttonForegroundColor ?? Colors.white,
            ),
            child: Text(buttonText ?? 'Ok'),
          ),
        ],
      );
    },
  );
  return response;
}
