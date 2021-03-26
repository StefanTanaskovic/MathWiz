import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/trivia_model.dart';

class TriviaListNotifier extends ChangeNotifier {
  List<TriviaModel> _triviaList = [];
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

  UnmodifiableListView<TriviaModel> get triviaList =>
      UnmodifiableListView(_triviaList);

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

  save(type, race) {
    for(var i = 0; i < race.questions.length; i++){
      print(race.questions[i].answers);
      print("object");
    }
    switch(type) { 
      case "Publish": {  
        race.status = "Publish";
      _triviaList.add(race);
      _selected = {};
      questions = [];
      } 
      break; 
    
      case "Drafts": { 
        race.status = "Drafts";
        _triviaList.add(race);
        _selected = {};
        questions = [];
      } 
      break; 
    } 
    notifyListeners();
  }

  changeStatus(status, index){
    triviaList[index].status = status;
    notifyListeners();
  }

  expansion(question, expand) {
    question.isExpanded = !expand;
    notifyListeners();
  }

  deleteRace(index) {
    _triviaList.removeAt(index);
    notifyListeners();
  }
}
