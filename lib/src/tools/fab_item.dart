import 'package:flutter/material.dart';

class FABItem {
  final Widget child;
  final VoidCallback onPressed;
  final String heroTag;
  final String? tooltip;

  FABItem({
    required this.child,
    required this.onPressed,
    required this.heroTag,
    this.tooltip,
  });
}