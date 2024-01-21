import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  String message,
) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.hideCurrentSnackBar();
  late final ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      controller;

  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        controller.close();
      },
    ),
  );

  controller = scaffoldMessenger.showSnackBar(snackBar);
  return controller;
}
