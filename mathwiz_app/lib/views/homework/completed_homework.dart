import 'package:flutter/material.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:mathwiz_app/widgets/text_field_container.dart';

import '../../constants.dart';

class CompletedHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompletedHomeworkScreenState();
      }
    }
    

class _CompletedHomeworkScreenState extends State<CompletedHomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
      title:Text(
              "Completed Homework",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.025,color: Colors.black),
            ),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey[500],width: 2.0)),
              padding: const EdgeInsets.all(5),
              child:Row(children: [            
              Container(
              width: size.width / 1.61,
              height: size.height * 0.22,
              child:Column(children: [
              Expanded(
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("Viktor Lampert",style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.022)),
              ],)
              ),
              ],)
              ),
              Container(
                child:Column(children: [
                Image.asset(
              "assets/images/math-placeholder.jpg",
              height: size.height * 0.2,
            )
                ],)
              )],)
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}