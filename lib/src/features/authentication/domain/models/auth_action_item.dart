import 'package:flutter/material.dart';

class AuthActionItem {
  const AuthActionItem({
    required this.text,
    required this.onPressed,
    this.secondaryText,
  });

  final String text;
  final String? secondaryText;
  final VoidCallback onPressed;
}
