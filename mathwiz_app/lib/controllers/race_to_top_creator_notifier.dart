import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import '../model/race_to_top.dart';

class RaceListNotifier extends ChangeNotifier {
  List<RaceTopModel> _raceQuizList = [];
  Map _selected = Map();
  List<QuestionAnswer> questions = [];

    
  setQuestions(value){
    questions = List.generate(
    value,
    (int i) =>QuestionAnswer(id: i,
                question: "",
                answers: [],
                correctAnswer: 0));
  }

  Map get selected => _selected;
  UnmodifiableListView<RaceTopModel> get raceQuizList =>
      UnmodifiableListView(_raceQuizList);

  radioValueChanged(id, value) {
    selected[id] = value;
    notifyListeners();
  }

  setCorrectAns(questions) {
    for(var i = 0; i < questions.length; i++){   
      questions[i].correctAnswer = selected[i];
    }
    notifyListeners();
  }

  save(type, quiz) {
    for(var i = 0; i < quiz.questions.length; i++){
      print(quiz.questions[i].answers);
    }
    switch(type) { 
      case "Publish": {  
        quiz.status = "Publish";
      _raceQuizList.add(quiz);
      _selected = {};
      questions = [];
      } 
      break; 
    
      case "Drafts": { 
        quiz.status = "Drafts";
        _raceQuizList.add(quiz);
        _selected = {};
        questions = [];
      } 
      break; 
    } 
    notifyListeners();
  }

  changeStatus(status, index){
    raceQuizList[index].status = status;
    notifyListeners();
  }

  expansion(question, expand) {
    question.isExpanded = !expand;
    notifyListeners();
  }

  deleteRace(index) {
    _raceQuizList.removeAt(index);
    notifyListeners();
  }
}
