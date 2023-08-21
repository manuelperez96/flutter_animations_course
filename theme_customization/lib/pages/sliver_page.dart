import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);
const _maxLeftOffset = 150.0;

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HeaderWithList(),
    );
  }
}

class _HeaderWithList extends StatefulWidget {
  const _HeaderWithList();

  @override
  State<_HeaderWithList> createState() => _HeaderWithListState();
}

class _HeaderWithListState extends State<_HeaderWithList> {
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
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: _CustomSliverDelegate(
            minHeight: 120,
            maxHeight: 180,
            child: const _Title(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 120),
          sliver: SliverList.builder(
            itemCount: 22,
            itemBuilder: _buildItem,
          ),
        ),
      ],
    );
  }

  Widget? _buildItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => _buildAnimation(context, child, index),
      child: _ListCardItem(index: index),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child, int index) {
    final startOffset = index * 120 + 180;
    final currentPosition = _controller.offset;
    final pivotValue = currentPosition - startOffset;
    final percentValue = pivotValue < 0 ? 0 : pivotValue / _maxLeftOffset;

    final finalPosition = clampDouble(
      -(percentValue * _maxLeftOffset),
      -_maxLeftOffset,
      0,
    );

    return Transform.translate(
      offset: Offset(index.isOdd ? finalPosition : -finalPosition, 0),
      child: Opacity(
        opacity: clampDouble(1 - percentValue.toDouble(), 0, 1),
        child: child,
      ),
    );
  }
}

class _CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  _CustomSliverDelegate({
    required double minHeight,
    required double maxHeight,
    required Widget child,
  })  : _child = child,
        _maxHeight = maxHeight,
        _minHeight = minHeight;

  final double _minHeight;
  final double _maxHeight;
  final Widget _child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _child;
  }

  @override
  double get maxExtent => math.max(_minHeight, _maxHeight);

  @override
  double get minExtent => math.min(_minHeight, _maxHeight);

  @override
  bool shouldRebuild(covariant _CustomSliverDelegate oldDelegate) {
    return _minHeight != oldDelegate._minHeight ||
        _maxHeight != oldDelegate._maxHeight ||
        _child != oldDelegate._child;
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.green.shade300,
        child: Center(
          child: Text(
            'My title',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}

class _ListCardItem extends StatelessWidget {
  const _ListCardItem({required int index}) : _index = index;

  final int _index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        color: Colors.accents[_index % Colors.accents.length],
      ),
    );
  }
}
