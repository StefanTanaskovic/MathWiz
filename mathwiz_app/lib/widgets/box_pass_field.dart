import 'package:flutter/material.dart';
import '../constants.dart';
import 'text_field_container.dart';

class BoxPassFeild extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final Function onSaved;
  final Function validator;

  const BoxPassFeild({
    Key key,
    this.onChanged,
    this.hintText,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFeildContainer(
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: kSecondaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        )
      ),
    );
  }
}
