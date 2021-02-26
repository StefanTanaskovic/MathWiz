import 'package:flutter/material.dart';

import '../constants.dart';

class BoxButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const BoxButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton(
          onPressed: press,
          child: Text(text),
          style: ElevatedButton.styleFrom(
              primary: color,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              textStyle: TextStyle(color: textColor))),
    );
  }
}
