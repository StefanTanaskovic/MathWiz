import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mathwiz_app/controllers/achievement_notifier.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';


class RaceQuizScreen extends StatefulWidget {

  final RaceTopModel quiz;
  RaceQuizScreen({this.quiz});

  @override
  State<StatefulWidget> createState() {
    return _RaceQuizScreenState(quiz: quiz);
  }
}

class _RaceQuizScreenState extends State<RaceQuizScreen> {
  final fb = FirebaseDatabase.instance;
  int score = 0;

  RaceTopModel quiz;
  int finalScore = 0;
  List colors = [Colors.red, kPrimaryColor, kSecondaryColor, Colors.blue];
  Random random = new Random();
  int colorIndex = 0;
  int questionIndex = 0;
  _RaceQuizScreenState({this.quiz});
  int _counter = 0;
  Timer _timer;
  bool timerFlag = false;
  @override
  Widget build(BuildContext context) {
    final raceList = Provider.of<List<RaceTopModel>>(context) ?? [];
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 11;  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(quiz.title),
      ),
      body: SafeArea(
        child: Builder(builder: (BuildContext context){
          switch(raceList[0].status) { 
            case "Waiting": {  
              return 
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("The quiz will start once the teacher starts it. Be ready as this is a race to the top.",
                    textAlign: TextAlign.center,        
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, ),
                  ),
                ),
              );
            } 
            break; 
          
            case "Start Time": {  
              return Center(
                child: CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (_, CurrentRemainingTime time) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Starting in:',
                          style: TextStyle(fontSize: 24, ),),
                        Text('${time.sec}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: kSecondaryColor ),
                        ),
                      ]
                    );
                  },
                  onEnd:(){
                    if (this.mounted) {
                      setState(() {
                        raceList[0].status = "Start Quiz";                                   
                      });
                    }
                  },
                ),
              );
            } 
            break; 
            
            case "Start Quiz": {  
              if (timerFlag ==  false){
              _startTimer();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildQuiz(questionIndex));
            }
            break; 
          } 
        return Text("");
        })
        ),
    );
  }

List <Widget> _buildQuiz(int i) {
  AchievementNotifier achievementNotifier =
  Provider.of<AchievementNotifier>(context,listen: false); 
  Size size = MediaQuery.of(context).size;
  final raceList = Provider.of<List<RaceTopModel>>(context) ?? [];
  UserModel user = Provider.of<UserModel>(context);
  if(questionIndex == quiz.questions.length){
    achievementNotifier.addPointsHomework().addPointsActivity();
    _timer.cancel();
    return <Widget>[
      Text("Congrats!",
        textAlign: TextAlign.center,        
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: kSecondaryColor),
      ),
      Text(
       "Your final score is $score and you got $finalScore/${quiz.questions.length} correct. You also earned ",
        textAlign: TextAlign.center,  
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24),
      ),
      Text(
       "${quiz.minReward} gold.",
        textAlign: TextAlign.center,  
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: goldColorGold),
      ),
    ];
  }
  else{
      return <Widget>[
          Text("Question: ${questionIndex + 1}/${quiz.questions.length}"),
          Text(
            quiz.questions[i].question,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: size.height * 0.6,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(quiz.questions[i].answers.length, (index) {
                return ElevatedButton (
                  style: ElevatedButton.styleFrom(primary: colors[index]),
                  onPressed: () {  
                    setState(() {
                      if (questionIndex == quiz.questions.length -1){
                        checkAnswer(i, index, raceList[0].id, user.uid);
                        questionIndex += 1;
                      }else{
                        checkAnswer(i, index, raceList[0].id, user.uid);
                        questionIndex += 1;
                      }
                    });
                  },
                  child: Text("${quiz.questions[i].answers[index]}"),
                );
              }),
            ),
        ),
        ];
  }
}

void checkAnswer(int question, int answerPicked, quizID, userID){
  final ref = fb.reference();
  if (quiz.questions[question].correctAnswer == answerPicked){
    score += 10 * (10 ~/_counter);
    ref.child("race").child(quizID).child(userID).child("score").set(score);
    finalScore += 1;
  }
}

  void _startTimer() {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _counter += 1;
        });
      });
      timerFlag = true;
  }

}
