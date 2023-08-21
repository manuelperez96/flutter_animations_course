import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_customization/pages/home_page.dart';
import 'package:theme_customization/states/theme_state.dart';
import 'package:theme_customization/theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeState(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isCustomTheme = context.watch<ThemeState>().isCustomTheme;
    final isDarkTheme = context.watch<ThemeState>().isDarkTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isCustomTheme
          ? AppBaseTheme.material().theme
          : isDarkTheme
              ? AppBaseTheme.dark().theme
              : AppBaseTheme.light().theme,
      home: const HomePage(),
    );
  }
}
