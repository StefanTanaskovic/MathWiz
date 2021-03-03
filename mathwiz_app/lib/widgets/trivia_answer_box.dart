import 'package:flutter/material.dart';
import 'package:mathwiz_app/views/Trivia/race_to_top.dart';
import '../constants.dart';
import 'text_field_container.dart';

class TriviaAnswerBox extends StatefulWidget {
  @override
  _TriviaAnswerBox createState() => _TriviaAnswerBox();
}

class _TriviaAnswerBox extends State<TriviaAnswerBox> {
  TextEditingController inputController = new TextEditingController();
  var text;
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),

        child: TextField(
          controller: inputController,
          decoration: InputDecoration(
            prefixIcon: Container(
              width: 50,
              height: 10,
              alignment: Alignment.center,
              child: Text("-", style: TextStyle(color: Colors.black)),
            ),
            suffixIcon:  IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Delete Answer',
                onPressed: (
                  
                ) {
                },
            ),
            hintText: "Enter Answer",
            border: InputBorder.none,
          ),
        ),
      );
  }
}
