import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_action_item.freezed.dart';

@freezed
class AuthActionItem with _$AuthActionItem {
  factory AuthActionItem({
    required String text,
    required VoidCallback onPressed,
    @Default(false) bool isLoading,
    String? secondaryText,
  }) = _AuthActionItem;
}
