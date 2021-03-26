import 'package:flutter/material.dart';
import '../constants.dart';
import 'text_field_container.dart';

class BoxInputFeild extends StatelessWidget {
  final String hintText;
  final Function(String) onSaved;
  final Function(String) validator;
  final IconData icon;
  final ValueChanged<String> onChanged;


  const BoxInputFeild({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFeildContainer(
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kSecondaryColor,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
