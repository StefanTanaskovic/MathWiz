
import 'package:flutter/material.dart';

import 'package:mathwiz_app/views/Trivia/race_to_top.dart';

import '../constants.dart';
import 'text_field_container.dart';

// ignore: must_be_immutable
class TriviaQuestionBox extends StatefulWidget {

  @override
  _TriviaQuestionBox createState() => _TriviaQuestionBox();
}

class _TriviaQuestionBox extends State<TriviaQuestionBox> {
  TextEditingController inputController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      
      return TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Text",
            border: InputBorder.none,
          ),
        );
  }
}
