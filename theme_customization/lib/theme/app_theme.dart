// ignore_for_file: unused_field

import 'package:flutter/material.dart';

abstract class AppBaseTheme {
  abstract final ThemeData theme;
  abstract final ColorScheme _colorScheme;
  abstract final IconThemeData _iconThemeData;
  abstract final ListTileThemeData _listTileThemeData;

  AppBaseTheme();

  factory AppBaseTheme.light() {
    return AppLightTheme();
  }

  factory AppBaseTheme.dark() {
    return AppDarkTheme();
  }

  factory AppBaseTheme.material() {
    return AppMaterialtheme();
  }
}

class AppLightTheme extends AppBaseTheme {
  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _colorScheme,
        scaffoldBackgroundColor: const Color(0xFFE8E9EB),
        iconTheme: _iconThemeData,
        primaryIconTheme: _iconThemeData,
        listTileTheme: _listTileThemeData,
      );

  @override
  ColorScheme get _colorScheme => const ColorScheme.light(
        background: Color(0xFFE8E9EB),
        surface: Color(0xFFE8E9EB),
        onSurface: Color(0xFF313638),
        onBackground: Color(0xFF313638),
        primary: Color(0xFFEF6461),
        secondary: Color(0xFFE4B363),
      );

  @override
  IconThemeData get _iconThemeData => IconThemeData(
        color: _colorScheme.primary,
      );

  @override
  ListTileThemeData get _listTileThemeData => ListTileThemeData(
        iconColor: _iconThemeData.color,
      );
}

class AppDarkTheme extends AppBaseTheme {
  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        colorScheme: _colorScheme,
        iconTheme: _iconThemeData,
        primaryIconTheme: _iconThemeData,
        listTileTheme: _listTileThemeData,
      );

  @override
  ColorScheme get _colorScheme => const ColorScheme.dark().copyWith(
        primary: const Color(0xFF7B4B94),
        secondary: const Color(0xFF7D82B8),
      );

  @override
  IconThemeData get _iconThemeData => IconThemeData(
        color: _colorScheme.primary,
      );

  @override
  ListTileThemeData get _listTileThemeData => ListTileThemeData(
        iconColor: _iconThemeData.color,
      );
}

class AppMaterialtheme extends AppLightTheme {
  @override
  ThemeData get theme => super.theme.copyWith(
        useMaterial3: true,
        //colorScheme: _colorScheme,
      );

  @override
  ColorScheme get _colorScheme => super._colorScheme.copyWith();
}
