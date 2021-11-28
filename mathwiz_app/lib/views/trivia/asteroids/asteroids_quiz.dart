import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mathwiz_app/controllers/homepage_student_controller.dart';
import 'package:mathwiz_app/controllers/main_notifier.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import 'package:mathwiz_app/model/user.dart';
import 'package:mathwiz_app/services/fs_database.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';


class AsteroidsQuizScreen extends StatefulWidget {
  final int index;
  final AsteroidModel quiz;
  AsteroidsQuizScreen({this.quiz, this.index});

  @override
  State<StatefulWidget> createState() {
    return _AsteroidsQuizScreenState(quiz: quiz, index: index);
  }
}

class _AsteroidsQuizScreenState extends State<AsteroidsQuizScreen> {
    @override
  void initState() {
    super.initState();
    _setLives(quiz.id,quiz.lives);
  }
  int index;
  final fb = FirebaseDatabase.instance;
  int score = 0;
  AsteroidModel quiz;
  int lives = 0;
  List colors = [Colors.red, kPrimaryColor, kSecondaryColor, Colors.blue];
  Random random = new Random();
  int colorIndex = 0;
  int questionIndex = 0;
  int timer;
  bool buttonClicked = false;
  bool questionCorrect = true;
  _AsteroidsQuizScreenState({this.quiz, this.index});


  void nextQuestion() {
    setState(() {
      questionIndex += 1;
      buttonClicked = false;
      questionCorrect = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 11;  
    final asteroidList = Provider.of<List<AsteroidModel>>(context) ?? [];
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(quiz.title),
        ),
        body: SafeArea(
          child: Builder(builder: (BuildContext context){
            switch(asteroidList[index].status) { 
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
                        asteroidList[index].status = "Start Quiz";                                   
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
  final asteroidList = Provider.of<List<AsteroidModel>>(context, listen: false) ?? [];
  UserModel user = Provider.of<UserModel>(context);
  FirestoreDatabaseService fsDatabase = Provider.of<FirestoreDatabaseService>(context, listen: false);
  Size size = MediaQuery.of(context).size;
  timer = DateTime.now().millisecondsSinceEpoch + 1000 * quiz.timer;
  
  if(questionIndex == quiz.questions.length){
    fsDatabase.updateBank(quiz.reward);
    return <Widget>[
      Text("Lives left: $lives",
        textAlign: TextAlign.center,        
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: kSecondaryColor),
      ),
      Text(
        "The Earth lived, Congrats!!",
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
              Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Center(
                  child: Column(
                  children: [ 
                    Stack(
                      children:[
                        Image.asset(
                          "assets/images/earth.png",
                            height: 250.0,
                            width: 250.0,),

                        (time.sec >= 3 && time.sec <= 6) ? Padding(
                          padding: EdgeInsets.only(left: 22.0),
                          child: Image.asset(
                          "assets/images/test3.gif",
                          height: 250.0,
                          width: 200.0,),) : Text(""),
                          
                        (time.sec < 3 && questionCorrect == false) ? Image.asset(
                          "assets/images/explosion.gif",
                          height: 250.0,
                          width: 250.0,) : Text(""),  
                        (time.sec < 3 && questionCorrect == true) ? Padding(
                          padding: EdgeInsets.only(left: 22.0),
                          child: Image.asset(
                          "assets/images/shield.png",
                          height: 250.0,
                          width: 200.0,),) : Text(""),
                      ])
                  ]),
                ),
              ),
            ]
          );
        },
        onEnd: nextQuestion,
      ),
      Text("Question: ${questionIndex + 1}/${quiz.questions.length}"),
      Text(
        quiz.questions[i].question,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        height: size.height * 0.35,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (3 / 2),
          children: List.generate(quiz.questions[i].answers.length, (index) {
            return ElevatedButton (
              style: ElevatedButton.styleFrom(primary: colors[index]),
              onPressed: () {  
                  if (questionIndex == quiz.questions.length -1){
                    _checkAnswer(i, index, asteroidList[index].id, user.uid);
                  }else{
                    _checkAnswer(i, index, asteroidList[index].id, user.uid);
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

  Future<void> _checkAnswer(int question, int answerPicked, quizID, userID) async {
    if (buttonClicked == false){
      if (quiz.questions[question].correctAnswer == answerPicked){
        questionCorrect = true;
      }else{
        questionCorrect = false;
        _increment(quizID);
      }
    }

    buttonClicked = true;
  }

  Future<void> _increment(quizID) async {
    DatabaseReference _counterRef = FirebaseDatabase.instance.reference().child("asteroids").child(quizID).child("lives");
    final TransactionResult transactionResult =
        await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = mutableData.value - 1;
      lives = mutableData.value;
      return mutableData;
    });
  }

  _setLives(quizID,lives){
    final ref = fb.reference();
    ref.child("asteroids").child(quizID).child("lives").set(lives);
  }



}
