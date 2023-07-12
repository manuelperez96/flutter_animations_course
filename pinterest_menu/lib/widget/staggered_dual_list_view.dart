import 'package:flutter/material.dart';

class StaggaredDualView extends StatelessWidget {
  const StaggaredDualView({
    super.key,
    required IndexedWidgetBuilder itemBuilder,
    required int itemCount,
    required double spacing,
    required double childAspectRatio,
    EdgeInsetsGeometry? padding,
    ScrollController? controller,
  })  : _controller = controller,
        _padding = padding,
        _childAspectRatio = childAspectRatio,
        _spacing = spacing,
        _itemCount = itemCount,
        _itemBuilder = itemBuilder;

  final IndexedWidgetBuilder _itemBuilder;
  final int _itemCount;
  final double _spacing;
  final double _childAspectRatio;
  final EdgeInsetsGeometry? _padding;
  final ScrollController? _controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final columnWidth =
          (constraints.maxWidth - _spacing - (_padding?.horizontal ?? 0)) / 2;
      final itemHeight = columnWidth / _childAspectRatio;
      final halfItemHeight = itemHeight / 2;

      final basePadding = EdgeInsets.only(
        top: halfItemHeight,
        bottom: itemHeight,
      );
      EdgeInsetsGeometry effectivePadding =
          _padding != null ? _padding!.add(basePadding) : basePadding;

      return OverflowBox(
        minHeight: constraints.minHeight + itemHeight,
        minWidth: constraints.minWidth,
        maxHeight: constraints.maxHeight + itemHeight,
        maxWidth: constraints.maxWidth,
        child: GridView.builder(
          controller: _controller,
          padding: effectivePadding,
          itemBuilder: (context, index) => _buildItem(
            context,
            index,
            halfItemHeight,
          ),
          itemCount: _itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: _childAspectRatio,
            crossAxisSpacing: _spacing,
            mainAxisSpacing: _spacing,
          ),
        ),
      );
    });
  }

  Widget _buildItem(BuildContext context, int index, double yOffset) {
    return Transform.translate(
      offset: index.isOdd ? Offset(0, yOffset) : const Offset(0, 0),
      child: _itemBuilder(context, index),
    );
  }
}
