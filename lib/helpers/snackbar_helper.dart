import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  SnackbarHelper._();

  static void showDeleteMessage({
    BuildContext context,
    String message,
  }) {
    Flushbar(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(8.0),
      message: message,
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.cancel,
        size: 28.0,
        color: Colors.red,
      ),
    ).show(context);
  }

  static void showUpdateMessage({
    BuildContext context,
    String message,
  }) {
    Flushbar(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(8.0),
      message: message,
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.refresh,
        size: 28.0,
        color: Colors.blue,
      ),
    ).show(context);
  }

  static void showCreateMessage({
    BuildContext context,
    String message,
  }) {
    Flushbar(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(8.0),
      message: message,
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.check,
        size: 28.0,
        color: Colors.green,
      ),
    ).show(context);
  }
}
