import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showUndoSnackBar({
  required BuildContext context,
  required String message,
  required Function onUndo,
  bool success = true,
}) {
  bool undoClicked = false;

  final snackBar = SnackBar(
    backgroundColor: Colors.blue,
    duration: const Duration(seconds: 3),  
    content: Row(
      children: [
        const Icon(
          Icons.info,
          color: Colors.white,
        ),
        const SizedBox(width: 12.0),
        Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'Deshacer',
      textColor: Colors.white,
      onPressed: () {
        onUndo();
        undoClicked = true; 
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  Future.delayed(const Duration(seconds: 3), () {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    
    if (!undoClicked) {
      Flushbar(
        title: 'Éxito',
        message: message,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
        ),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        duration: const Duration(seconds: 1),
      ).show(context);
    }
  });
}

class CustomFlushbar {
  static void showErrorFlushbar(BuildContext context, String message) {
    Flushbar(
            title: 'Error',
            message: message,
            icon: const Icon(
                   Icons.error_outline_rounded,
              color:Colors.red,
            ),
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            duration: const Duration(seconds: 3),
          ).show(context);
  }
}
