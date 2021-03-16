import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/race_to_top.dart';
import '../../constants.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {

  RaceTop quiz = RaceTop(title: "Quiz 5", questions: [
    QuestionAnswer(id: 0,
                question: "What is 10x1",
                answers: ["10","2","4","7"],
                correctAnswer: 1),
    QuestionAnswer(id: 1,
                question: "What is 10x5",
                answers: ["10","20","40","50"],
                correctAnswer: 4)
  ]);

  int finalScore = 0;
  List colors = [Colors.red, kPrimaryColor, kSecondaryColor, Colors.blue];
  Random random = new Random();
  int colorIndex = 0;
  int questionIndex = 0;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(quiz.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildQuiz(questionIndex, status)

        ),
      ),
    );
  }

List <Widget> _buildQuiz(int i, bool status) {
  Size size = MediaQuery.of(context).size;
  print("--------------");
  print("this is the status");
  print(status);
  print("--------------");

  if(questionIndex == quiz.questions.length){
    return <Widget>[
      Text("$finalScore")
    ];
  }
  else{
      return <Widget>[
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
                        checkAnswer(i, index);
                        print("finished quiz");
                        status = true;
                      }else{
                        checkAnswer(i, index);
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

void checkAnswer(int question, int answerPicked){
  if (quiz.questions[question].correctAnswer == answerPicked + 1){
    finalScore += 1;
  }
}

}
