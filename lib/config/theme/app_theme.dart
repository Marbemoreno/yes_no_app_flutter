import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 74, 36, 155);

const List<Color> _colorsTheme = [
  _customColor,
  Colors.pink,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0}):assert(selectedColor >= 0 && selectedColor < _colorsTheme.length, 'selectedColor must be between 0 and ${_colorsTheme.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, 
      colorSchemeSeed: _colorsTheme[selectedColor],
      // brightness: Brightness.dark, //  para el tema oscuro
    );
  }
}
