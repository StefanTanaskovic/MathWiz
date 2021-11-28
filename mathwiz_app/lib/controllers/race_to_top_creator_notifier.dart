import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import '../model/race_to_top.dart';

class RaceListNotifier extends ChangeNotifier {
  List<RaceTopModel> _raceQuizList = [];
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

  save(type, RaceTopModel quiz, classID) {
    switch(type) { 
      case "Publish": { 
        quiz.published = true;
      _raceQuizList.add(quiz);
      _selected = {};
      questions = [];
      } 
      break; 
    
      case "Drafts": { 
        quiz.published = false;
        _raceQuizList.add(quiz);
        _selected = {};
        questions = [];
      } 
      break; 
    } 
    quiz.status = "Waiting";
    FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classID).collection('races').add(
          json.decode(jsonEncode(quiz)),
        );
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
