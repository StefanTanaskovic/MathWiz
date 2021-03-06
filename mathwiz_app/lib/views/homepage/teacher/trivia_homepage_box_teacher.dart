import 'package:mathwiz_app/controllers/homepage_teacher_controller.dart';
import 'package:mathwiz_app/model/trivia_model.dart';

import '../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mathwiz_app/controllers/trivia_activity_notifier.dart';
import 'package:mathwiz_app/views/trivia/trivia_activity/trivia_quiz_screen.dart';


class TriviaHomepageBoxTeacher extends StatefulWidget {
  @override
  _TriviaHomepageBoxTeacherState createState() => _TriviaHomepageBoxTeacherState();
}

class _TriviaHomepageBoxTeacherState extends State<TriviaHomepageBoxTeacher> {
  @override
  Widget build(BuildContext context) {
    final triviaList = Provider.of<List<TriviaModel>>(context) ?? [];
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
            ),
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Trivia',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),

            Expanded(
              child: ListView.builder(
                itemCount: triviaList.length,
                itemBuilder: (context, index) {
                  if(triviaList[index].published == true){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${triviaList[index].title}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return TriviaQuizScreen(quiz: triviaList[index]);
                                //     },
                                //   ),
                                // );
                              },
                          ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            child: Text('Unpublish'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                            onPressed: () {
                              HomepageTeacherController().changeStatusRace("Drafts",triviaList[index].id);
                            },
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child: Text("Start"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                HomepageTeacherController().startRace(triviaList[index].id);
                              },
                            ),
                          ),
                      ]
                    );
                  }else {
                    return Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: ElevatedButton(
                                child: Text('${triviaList[index].title}'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white.withOpacity(0.7),
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {},
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child: Text('Publish'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                HomepageTeacherController().changeStatusRace("Publish",triviaList[index].id);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              child: Icon(Icons.delete),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                //RaceListNotifier().deleteRace(index);
                              },
                            ),
                          ),
                        ]
                  );
                  }
                }
            ),
            ),
            SizedBox(height: 10),
          ],
        )
    );
  }
}
