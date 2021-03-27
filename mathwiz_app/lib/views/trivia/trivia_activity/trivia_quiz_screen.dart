import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mathwiz_app/model/trivia_model.dart';
import '../../../constants.dart';


class TriviaQuizScreen extends StatefulWidget {

  final TriviaModel quiz;
  TriviaQuizScreen({this.quiz});

  @override
  State<StatefulWidget> createState() {
    return _TriviaQuizScreenState(quiz: quiz);
  }
}

class _TriviaQuizScreenState extends State<TriviaQuizScreen> {
  TriviaModel quiz;
  int finalScore = 0;
  List colors = [Colors.red, kPrimaryColor, kSecondaryColor, Colors.blue];
  Random random = new Random();
  int colorIndex = 0;
  int questionIndex = 0;
  String status = "Start Time" ;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 11;
  int timer;
  bool buttonClicked = false;
  _TriviaQuizScreenState({this.quiz});

  void startQuiz() {
    if (this.mounted) {
    setState(() {
      status = "Start Quiz";
    });
    }
  }

  void nextQuestion() {
    setState(() {
      questionIndex += 1;
      buttonClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(quiz.title),
      ),
      body: SafeArea(
        child: Builder(builder: (BuildContext context){
          switch(status) { 
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
                  onEnd: startQuiz,
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
        return Text("This is dumb");
        })
        ),
    );
  }

List <Widget> _buildQuiz(int i) {
  Size size = MediaQuery.of(context).size;
  timer = DateTime.now().millisecondsSinceEpoch + 1000 * quiz.timer;
  if(questionIndex == quiz.questions.length){
    return <Widget>[
      Text("Congrats!",
        textAlign: TextAlign.center,        
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: kSecondaryColor),
      ),
      Text(
        "Your final score is $finalScore/${quiz.questions.length} and you came in 1st place.",
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
                        checkAnswer(i, index);
                      }else{
                        checkAnswer(i, index);
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

  void checkAnswer(int question, int answerPicked){
    if (buttonClicked == false){
      if (quiz.questions[question].correctAnswer == answerPicked){
        finalScore += 1;
      }
    }
    buttonClicked = true;
  }

}
