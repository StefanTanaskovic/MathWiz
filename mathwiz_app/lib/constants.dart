import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// Primary is Teal
const kPrimaryColor = Colors.teal;
var kPrimaryLightColor = Colors.teal[100];

// Secondary is Purple
const kSecondaryColor = Colors.purple;
var kSecondaryLightColor = Colors.purple[200];

// Background is White
const kBackgroundColor = Colors.white;

// Test Colors
Color testColorPurple = HexColor("#724CF9");
