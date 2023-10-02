import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 125, 36, 36);

const List<Color> colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: colorTheme[selectedColor]
        //brightness: Brightness.dark
        );
  }
}
