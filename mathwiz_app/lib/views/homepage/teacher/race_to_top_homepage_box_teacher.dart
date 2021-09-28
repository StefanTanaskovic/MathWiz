import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/homepage_teacher_controller.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/r2t_quiz.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class RaceToTopHomepageBoxTeacher extends StatefulWidget {
  @override
  _RaceToTopHomepageBoxTeacherState createState() => _RaceToTopHomepageBoxTeacherState();
}

class _RaceToTopHomepageBoxTeacherState extends State<RaceToTopHomepageBoxTeacher> {
  @override
  Widget build(BuildContext context) {
    final raceList = Provider.of<List<RaceTopModel>>(context) ?? [];
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
            Text('Race to the Top',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white)),

            Expanded(
              child: ListView.builder(
                itemCount: raceList.length,
                itemBuilder: (context, index) {
                  if(raceList[index].published == true){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${raceList[index].title}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RaceQuizScreen(quiz: raceList[index]);
                                    },
                                  ),
                                );
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
                              HomepageTeacherController().changeStatusRace("Drafts",raceList[index].id);
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
                              HomepageTeacherController().startRace(raceList[index].id);
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
                                child: Text('${raceList[index].title}'),
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
                                HomepageTeacherController().changeStatusRace("Publish",raceList[index].id);
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
