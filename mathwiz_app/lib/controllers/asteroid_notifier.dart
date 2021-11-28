import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mathwiz_app/model/answer_question.dart';
import 'package:mathwiz_app/model/asteroid_model.dart';
import '../model/race_to_top.dart';

class AsteroidListNotifier extends ChangeNotifier {
  List<AsteroidModel> _asteroidList = [];
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
  UnmodifiableListView<AsteroidModel> get asteroidList =>
      UnmodifiableListView(_asteroidList);

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

  save(type, AsteroidModel quiz, classID) {
    switch(type) { 
      case "Publish": { 
        quiz.published = true;
      _asteroidList.add(quiz);
      _selected = {};
      questions = [];
      } 
      break; 
    
      case "Drafts": { 
        quiz.published = false;
        _asteroidList.add(quiz);
        _selected = {};
        questions = [];
      } 
      break; 
    } 
    quiz.status = "Waiting";
    FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classID).collection('asteroids').add(
          json.decode(jsonEncode(quiz)),
        );
    notifyListeners();
  }

  changeStatus(status, index){
    _asteroidList[index].status = status;
    notifyListeners();
  }

  expansion(question, expand) {
    question.isExpanded = !expand;
    notifyListeners();
  }

  deleteRace(index) {
    _asteroidList.removeAt(index);
    notifyListeners();
  }
}
