import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/trivia_model.dart';

class TriviaListNotifier extends ChangeNotifier {
  List<TriviaModel> _triviaList = [];
  Map _selected = Map();
  List<QuestionAnswerModel> questions = [];

    
  setQuestions(value){
    questions = List.generate(
    value,
    (int i) =>QuestionAnswerModel(id: i,
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

  save(type, TriviaModel quiz, classID) {
    switch(type) { 
      case "Publish": { 
        quiz.published = true;
      _triviaList.add(quiz);
      _selected = {};
      questions = [];
      } 
      break; 
    
      case "Drafts": { 
        quiz.published = false;
        _triviaList.add(quiz);
        _selected = {};
        questions = [];
      } 
      break; 
    } 
    quiz.status = "Waiting";
    FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classID).collection('trivias').add(
          json.decode(jsonEncode(quiz)),
        );
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
