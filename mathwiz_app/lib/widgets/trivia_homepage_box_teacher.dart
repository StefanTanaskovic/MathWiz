import '../constants.dart';
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
                itemCount: context.watch<TriviaListNotifier>().triviaList.length,
                itemBuilder: (context, index) {
                  if(context.read<TriviaListNotifier>().triviaList[index].status == "Publish"){
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: ElevatedButton(
                              child: Text('${context.watch<TriviaListNotifier>().triviaList[index].title}'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TriviaQuizScreen(quiz: context.read<TriviaListNotifier>().triviaList[index]);
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
                              context.read<TriviaListNotifier>().changeStatus("Drafts", index);
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
                                child: Text('${context.watch<TriviaListNotifier>().triviaList[index].title}'),
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
                                context.read<TriviaListNotifier>().changeStatus("Publish", index);

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
                                context.read<TriviaListNotifier>().deleteRace(index);
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
