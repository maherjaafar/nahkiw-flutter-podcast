import 'package:flutter/material.dart';

extension FlexX on Flex {
  Widget separatedBy(double padding) {
    final isRow = this is Row;
    final separation = SizedBox(
      width: isRow ? padding : 0,
      height: isRow ? 0 : padding,
    );
    final newChildren = [
      for (final child in children) ...[
        child,
        separation,
      ],
    ];
    return Flex(
      direction: direction,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: newChildren,
    );
  }
}
