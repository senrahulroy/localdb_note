import 'package:flutter/material.dart';

class AppTextStyle {
  // Text style with a specific font size, italic, and fixed color
  static const TextStyle italicFixedColor = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    color: Colors.blue,
  );

  // Text style with a larger font size, bold, and fixed color
  static const TextStyle largeBoldFixedColor = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );

  // Text style with a smaller font size and regular weight
  static const TextStyle smallRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Variable text style with customizable parameters
  static TextStyle variableTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    bool italic = false,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
