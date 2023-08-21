import 'package:flutter/material.dart';
import 'package:theme_customization/widgets/wave_header.dart';

class WaveHeaderPage extends StatelessWidget {
  const WaveHeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WaveHeader(waves: 3),
    );
  }
}
