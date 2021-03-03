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


//var kSecondaryColor = Colors.purple[600];
const kPrimaryLightColor = Colors.white;
//var kSecondaryColor = Colors.purple[200];

Color  richBlackFogra = HexColor("#000505");
//Color  kPrimaryColor = HexColor("#3B3355");
Color  kSecondaryColor = HexColor("#8A7E72");
Color  kPrimaryColor = HexColor("#724CF9");
Color  white = HexColor("#FEFCFD");

