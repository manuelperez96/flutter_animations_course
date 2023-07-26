import 'package:flutter/material.dart';
import 'package:sliver_section/page/sliver_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliverPage(),
    );
  }
}
