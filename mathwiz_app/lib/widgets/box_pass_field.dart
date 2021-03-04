import 'package:flutter/material.dart';
import '../constants.dart';
import 'text_field_container.dart';

class BoxPassFeild extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const BoxPassFeild({
    Key key,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFeildContainer(
      child: TextField(
          obscureText: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              Icons.lock,
              color: kSeonndaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          )),
    );
  }
}
