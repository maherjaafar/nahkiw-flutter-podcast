import 'package:flutter/material.dart';

extension NullableTextStyleX on TextStyle? {
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.bold);
}
