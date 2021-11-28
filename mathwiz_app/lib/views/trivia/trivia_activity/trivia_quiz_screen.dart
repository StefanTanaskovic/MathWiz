import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';


class TriviaQuizScreen extends StatefulWidget {
  final int index;
  final TriviaModel quiz;
  TriviaQuizScreen({this.quiz, this.index});

  @override
  State<StatefulWidget> createState() {
    return _TriviaQuizScreenState(quiz: quiz, index: index);
  }
}

class _TriviaQuizScreenState extends State<TriviaQuizScreen> {
  final fb = FirebaseDatabase.instance;
  int score = 0;
  int index;
  TriviaModel quiz;
  int finalScore = 0;
  List colors = [Colors.red, kPrimaryColor, kSecondaryColor, Colors.blue];
  Random random = new Random();
  int colorIndex = 0;
  int questionIndex = 0;
  int timer;
  bool buttonClicked = false;
  _TriviaQuizScreenState({this.quiz, this.index});


  void nextQuestion() {
    setState(() {
      questionIndex += 1;
      buttonClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 11;  
    final triviaList = Provider.of<List<TriviaModel>>(context) ?? [];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(quiz.title),
      ),
      body: SafeArea(
        child: Builder(builder: (BuildContext context){
          switch(triviaList[index].status) { 
            case "Waiting": {  
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("The quiz will start once the teacher starts it. Be ready!",
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
                          style: TextStyle(fontSize: 24,color: kPrimaryColor ),),
                      ]
                    );
                  },
                  onEnd:(){
                    if (this.mounted) {
                    setState(() {
                      triviaList[index].status = "Start Quiz";                                   
                    });
                    }
                  },
                ),
              );
            } 
            break; 

            case "Start Quiz": {  
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
  final triviaList = Provider.of<List<TriviaModel>>(context) ?? [];
  UserModel user = Provider.of<UserModel>(context);
  Size size = MediaQuery.of(context).size;
  timer = DateTime.now().millisecondsSinceEpoch + 1000 * quiz.timer;
    FirestoreDatabaseService fsDatabase =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
  fsDatabase.updateBank(quiz.minReward);
  if(questionIndex == quiz.questions.length){
    return <Widget>[
      Text("Congrats!",
        textAlign: TextAlign.center,        
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: kSecondaryColor),
      ),
      Text(
        "Your final score is $score and you got $finalScore/${quiz.questions.length} correct",
        textAlign: TextAlign.center,  
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24),
      ),
    ];
  }
  else{
      return <Widget>[
          CountdownTimer(
            endTime: DateTime.now().millisecondsSinceEpoch + 1000 * quiz.timer,
            widgetBuilder: (_, CurrentRemainingTime time) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Time left:',
                    style: TextStyle(fontSize: 16, ),),
                  Text('${time.sec}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: kSecondaryColor ),
                  ),
                ]
              );
            },
            onEnd: nextQuestion,
          ),
          SizedBox(
            height:  MediaQuery.of(context).size.height * 0.05,
          ),
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
                      if (questionIndex == quiz.questions.length -1){
                        checkAnswer(i, index, triviaList[index].id, user.uid);
                      }else{
                        checkAnswer(i, index, triviaList[index].id, user.uid);
                      }
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
    if (buttonClicked == false){
      if (quiz.questions[question].correctAnswer == answerPicked){
        score += 10;
        ref.child("trivia").child(quizID).child(userID).child("score").set(score);
        finalScore += 1;
      }
    }
    buttonClicked = true;
  }

}
