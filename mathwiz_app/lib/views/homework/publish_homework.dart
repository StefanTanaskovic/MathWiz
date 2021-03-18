import 'package:flutter/material.dart';
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import '../../constants.dart';

class PublishHomeworkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PublishHomeworkScreenState();
  }
}

class _PublishHomeworkScreenState extends State<PublishHomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Homework",
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
              IconButton(
                  iconSize: 100,
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {}),
              BoxInputFeild(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {},
              ),
              // Slider(
              //   value: _currentSliderValue,
              //   min: 0,
              //   max:100,
              //   onChanged: (double value){
              //   setState(() {
              //     _currentSliderValue = value;
              //   });
              // },),
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
