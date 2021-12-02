import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/homework_model.dart';
import 'package:mathwiz_app/controllers/publish_homework_notifier.dart';
import 'package:mathwiz_app/views/homepage/teacher/homepage_teacher.dart';
import 'dart:ui' as ui;
import 'package:mathwiz_app/widgets/box_button.dart';
import 'package:mathwiz_app/widgets/box_input_field.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class PublishHomeworkScreen extends StatefulWidget {
  final String text;
  PublishHomeworkScreen({Key key, @required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PublishHomeworkScreenState();
  }
}

List<Widget> children;

class _PublishHomeworkScreenState extends State<PublishHomeworkScreen> {
  
  Map selected = new Map();
  final String text;
  int goldAmount;
  String homeworkDescription;
  String homeworkTitle;

  final _formKey = GlobalKey<FormState>();

  _PublishHomeworkScreenState({this.text});
  @override
  Widget build(BuildContext context) {
    HomeworkListNotifier homeworkListNotifier =
        Provider.of<HomeworkListNotifier>(context, listen: false);

    ui.Size size = MediaQuery.of(context)
        .size; // provides total hieght and width of screen
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
              Text(widget.text.isEmpty ? 'No text found': widget.text,
              style: TextStyle(fontSize: 20),),
              BoxInputFeild(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {
                homeworkTitle = value;
                },
              ),
              BoxInputFeild(
                hintText: "Coins",
                icon: Icons.attach_money,
                onChanged: (value) {
                goldAmount = int.parse(value);
                },
              ),
              BoxInputFeild(
                hintText: "Description",
                icon: Icons.description,
                onChanged: (value) {
                homeworkDescription = value;
                },
              ),
              BoxButton(
                text: "Save To Drafts",
                press: () {
                    print(text);
                    homeworkListNotifier.save(
                    "Drafts", 
                    HomeworkModel(
                    ocrtext: widget.text,
                    title: homeworkTitle, 
                    status: "Drafts",
                    gold:goldAmount, 
                    description: homeworkDescription)
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomepageTeacherScreen();
                        },
                      ),
                    );
                  }),
              BoxButton(
                text: "Publish",
                press: () {
                    homeworkTitle = 
                    homeworkListNotifier.save(
                    "Publish", 
                    HomeworkModel(
                    ocrtext: widget.text,
                    title: homeworkTitle, 
                    status: "Publish",
                    gold:goldAmount, 
                    description: homeworkDescription)
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomepageTeacherScreen();
                      },
                    ),
                  );
                },
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
