
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message {
  Message._();

  static showErrorMessage(
    BuildContext context,
    String message,
  ) {
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          Flushbar(
            title: 'Error',
            message: message,
            icon: const Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
            ),
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      });
    }

    return const SizedBox.shrink();
  }

  static showMessage(
    BuildContext context,
    String message,
    bool success,
  ) {
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              Future.delayed(const Duration(seconds: 3), () {
                Navigator.of(context).pop();
              });
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 5.0), // Ajusta el ancho de la ventana emergente
                title: Column(
                  children: [
                    Icon(
                      success ? Icons.check_circle : Icons.error,
                      color: success ? Colors.green : Colors.red,
                      size: 100,
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(success ? 'Exitoso' : 'Reintentar',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 29, 29, 29),
                            fontSize: 30)),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              );
            },
          );
        }
      });
    }
    return const SizedBox.shrink();
  }

  static void showToast({
    required String message,
    Color? color,
    Direction? direction,
    bool toastLengthLong = false,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLengthLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: directionValues.map[direction],
      timeInSecForIosWeb: 30,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void hideToast() {
    Fluttertoast.cancel();
  }
}

enum PositionToast {
  TOP,
  BOTTOM,
}

final _PositionToastValues positionValues = _PositionToastValues({
  PositionToast.TOP: FlushbarPosition.TOP,
  PositionToast.BOTTOM: FlushbarPosition.BOTTOM,
});

class _PositionToastValues<T> {
  final Map<PositionToast, T> map;

  _PositionToastValues(this.map);
}

enum Direction {
  TOP,
  BOTTOM,
  CENTER,
}

final _DirectionValues directionValues = _DirectionValues({
  Direction.TOP: ToastGravity.TOP,
  Direction.BOTTOM: ToastGravity.BOTTOM,
  Direction.CENTER: ToastGravity.CENTER,
});

class _DirectionValues<T> {
  final Map<Direction, T> map;

  _DirectionValues(this.map);
}
