import 'package:flutter/material.dart';

class Slideshow extends StatefulWidget {
  const Slideshow({
    super.key,
    children = const <Widget>[],
    PageController? pageController,
  })  : _children = children,
        _pageController = pageController;

  final PageController? _pageController;
  final List<Widget> _children;

  @override
  State<Slideshow> createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  late final PageController _pageController;
  var _dotPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = widget._pageController ?? PageController();
    _pageController.addListener(_updateDotOnPageChange);
  }

  void _updateDotOnPageChange() {
    _dotPosition = _pageController.page ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView(
            controller: _pageController,
            children: widget._children,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: _Dots(
              amount: widget._children.length,
              position: _dotPosition,
            ),
          ),
        )
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    required this.amount,
    required this.position,
  });

  final int amount;
  final double position;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(amount, _buildDot)
              .expand(_addSpacer)
              .take(amount * 2 - 1)
              .toList(),
        ),
        Positioned(
          left: position * 20,
          top: 0,
          child: const _Dot(isSelected: true),
        )
      ],
    );
  }

  Widget _buildDot(int index) {
    return const _Dot(isSelected: false);
  }

  Iterable<Widget> _addSpacer(Widget dot) {
    return [
      dot,
      const SizedBox(width: 8),
    ];
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox.square(
      dimension: 12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? colors.primary : colors.background,
        ),
      ),
    );
  }
}
