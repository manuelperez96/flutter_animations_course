import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);
const _maxLeftOffset = 150.0;

class AnimatedScrollView extends StatefulWidget {
  const AnimatedScrollView({
    super.key,
    required Widget Function(BuildContext, int) builder,
    required int itemCount,
    required double itemExtent,
  })  : _itemExtent = itemExtent,
        _itemCount = itemCount,
        _builder = builder;

  final IndexedWidgetBuilder _builder;
  final int _itemCount;
  final double _itemExtent;

  @override
  State<AnimatedScrollView> createState() => _AnimatedScrollViewState();
}

class _AnimatedScrollViewState extends State<AnimatedScrollView> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemExtent: widget._itemExtent,
      itemCount: widget._itemCount,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => _buildAnimation(context, child, index),
      child: widget._builder(context, index),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child, int index) {
    final startOffset = index * widget._itemExtent;
    final currentPosition = _controller.offset;
    final pivotValue = currentPosition - startOffset;
    final percentValue = pivotValue < 0 ? 0 : pivotValue / _maxLeftOffset;

    final finalPosition = clampDouble(
      -(percentValue * _maxLeftOffset),
      -_maxLeftOffset,
      0,
    );

    return Transform.translate(
      offset: Offset(finalPosition, 0),
      child: Opacity(
        opacity: (1 - percentValue.toDouble()).clamp(0, 1),
        child: child,
      ),
    );
  }
}
