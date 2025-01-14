library;

import 'package:animated_fab/src/tools/fab_item.dart';
import 'package:flutter/material.dart';

export 'package:animated_fab/src/tools/fab_item.dart';

class AnimatedFAB extends StatefulWidget {
  /// The items to display in the expanded FAB.
  final List<FABItem> items;

  /// Whether the main FAB should be mini-sized.
  final bool mini;

  /// Whether the main FAB should be autofocused.
  final bool autofocus;

  /// The background color of the main FAB.
  final Color? backgroundColor;

  /// The elevation of the main FAB.
  final double? elevation;

  /// The hero tag for the main FAB.
  final Object? heroTag;

  /// The hover color of the main FAB.
  final Color? hoverColor;

  /// The mouse cursor to display when hovering over the main FAB.
  final MouseCursor? mouseCursor;

  /// The highlight elevation of the main FAB.
  final double? highlightElevation;

  /// The focus color of the main FAB.
  final Color? focusColor;

  /// The disabled elevation of the main FAB.
  final double? disabledElevation;

  /// The focus elevation of the main FAB.
  final double? focusElevation;

  /// The hover elevation of the main FAB.
  final double? hoverElevation;

  /// The splash radius of the main FAB.
  final double? splashRadius;

  /// Whether to enable feedback for the main FAB.
  final bool enableFeedback;

  /// The splash color of the main FAB.
  final Color? splashColor;

  /// The shape of the main FAB.
  final ShapeBorder? shape;

  /// The clip behavior of the main FAB.
  final Clip clipBehavior;

  /// The tooltip for the main FAB.
  final String? tooltip;

  /// The background color of the FAB items.
  final Color? backgroundColorFABItem;

  /// The widget to display as the icon for the main FAB.
  final Widget? fABIcon;

  /// Creates an AnimatedFAB.
  ///
  /// The [items] parameter is required and must contain at least one FABItem.
  ///
  /// The other parameters are optional and can be used to customize the
  /// appearance and behavior of the FAB.
  ///
  /// For example, to create a mini-sized FAB with a red background, you would
  /// use the following code:
  ///
  ///
  const AnimatedFAB({
    super.key,
    required this.items,
    this.mini = false,
    this.autofocus = false,
    this.backgroundColor,
    this.elevation,
    this.heroTag,
    this.hoverColor,
    this.mouseCursor,
    this.highlightElevation,
    this.focusColor,
    this.disabledElevation,
    this.focusElevation,
    this.hoverElevation,
    this.splashRadius,
    this.enableFeedback = true,
    this.splashColor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.tooltip,
    this.backgroundColorFABItem,
    this.fABIcon,
  });

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Positioned(
          bottom: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isExpanded) ...[
                ...widget.items.map((item) => _buildFabItem(item)),
                const SizedBox(height: 10),
              ],
              _buildMainFAB(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainFAB() {
    return FloatingActionButton(
      mini: widget.mini,
      autofocus: widget.autofocus,
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      heroTag: widget.heroTag ?? UniqueKey(),
      hoverColor: widget.hoverColor,
      mouseCursor: widget.mouseCursor,
      highlightElevation: widget.highlightElevation,
      focusColor: widget.focusColor,
      disabledElevation: widget.disabledElevation,
      focusElevation: widget.focusElevation,
      shape: widget.shape,
      clipBehavior: widget.clipBehavior,
      enableFeedback: widget.enableFeedback,
      splashColor: widget.splashColor,
      tooltip: widget.tooltip,
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
          if (_isExpanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: widget.fABIcon ??
          AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _controller,
          ),
    );
  }

  Widget _buildFabItem(FABItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.elasticOut,
          ),
        ),
        child: FloatingActionButton(
          mini: true,
          heroTag: item.heroTag,
          tooltip: item.tooltip,
          backgroundColor: widget.backgroundColorFABItem,
          onPressed: () {
            // Close the FAB before navigating
            setState(() {
              _isExpanded = false;
              _controller.reverse();
            });
            item.onPressed();
          },
          child: item.child,
        ),
      ),
    );
  }
}
