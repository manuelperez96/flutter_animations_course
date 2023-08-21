import 'package:flutter/material.dart';

class RoundedRightHeader extends StatelessWidget {
  const RoundedRightHeader({
    super.key,
    Widget? child,
  }) : _child = child;

  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.blue.shade700,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: _child,
      ),
    );
  }
}
