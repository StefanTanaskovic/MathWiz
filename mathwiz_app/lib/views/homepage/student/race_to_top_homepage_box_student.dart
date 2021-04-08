import 'package:flutter/material.dart';
import 'package:mathwiz_app/controllers/race_to_top_creator_notifier.dart';
import 'package:mathwiz_app/views/trivia/race_to_top/r2t_quiz.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class RaceToTopHomepageBoxStudent extends StatefulWidget {
  @override
  _RaceToTopHomepageBoxStudentState createState() => _RaceToTopHomepageBoxStudentState();
}

class _RaceToTopHomepageBoxStudentState extends State<RaceToTopHomepageBoxStudent> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: context.watch<RaceListNotifier>().raceQuizList.length,
                itemBuilder: (context, index) {
                  if(context.read<RaceListNotifier>().raceQuizList[index].status == "Publish"){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${context.watch<RaceListNotifier>().raceQuizList[index].title}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RaceQuizScreen(quiz: context.watch<RaceListNotifier>().raceQuizList[index]);
                                    },
                                  ),
                                );
                              },
                          ),
                          ),
                        ),
                      ]
                    );
                  }else{
                    return null;
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
