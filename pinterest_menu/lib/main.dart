import 'package:flutter/material.dart';
import 'package:pinterest_menu/page/staggered_dual_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        cardTheme: const CardTheme(margin: EdgeInsets.zero),
      ),
      home: const StaggaredDualListPage(),
    );
  }
}
