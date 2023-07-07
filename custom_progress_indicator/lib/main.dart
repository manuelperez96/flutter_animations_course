import 'package:custom_progress_indicator/page/circular_arc_progress_indicator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CircularArcProgressIndicatorPage(),
    );
  }
}
