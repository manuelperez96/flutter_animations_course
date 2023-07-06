import 'package:background_custom_painter/widgets/wave_header.dart';
import 'package:flutter/material.dart';

class WaveHeaderPage extends StatelessWidget {
  const WaveHeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WaveHeader(waves: 3),
    );
  }
}
