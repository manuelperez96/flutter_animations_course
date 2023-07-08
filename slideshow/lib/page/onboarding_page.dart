import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow/widget/slideshow.dart';

const _slideImages = <String>[
  'assets/slide1.svg',
  'assets/slide2.svg',
  'assets/slide3.svg',
  'assets/slide4.svg',
];

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(children: _slideImages.map(_toSvg).toList()),
    );
  }

  Widget _toSvg(String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SvgPicture.asset(asset),
    );
  }
}
