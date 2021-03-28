import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import '../../constants.dart';

class PublishHomeworkScreen extends StatefulWidget {
  final String text;
  PublishHomeworkScreen(this.text);
  @override
  State<StatefulWidget> createState() {
    return _PublishHomeworkScreenState();
  }
}

class _PublishHomeworkScreenState extends State<PublishHomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    ui.Size size = MediaQuery.of(context)
        .size;// provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish Homework",
            style: TextStyle(
              fontSize: 20,
            )),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SelectableText(widget.text.isEmpty ? 'No text found': widget.text),
              BoxInputFeild(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {},
              ),
              BoxInputFeild(
                hintText: "Coins",
                icon: Icons.attach_money,
                onChanged: (value) {},
              ),
              Container(
                width: size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      hintText: 'Description'),
                  maxLines: 5,
                ),
              ),
              BoxButton(
                text: "Save To Drafts",
                press: () {},
              ),
              BoxButton(
                text: "Publish",
                press: () {},
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}