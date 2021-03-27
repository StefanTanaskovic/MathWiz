import 'answer_question.dart';

class RaceTopModel {
  RaceTopModel({
    this.title,
    this.questions,
    this.minReward,
    this.firstReward,
    this.status

  });

  String title;
  List<QuestionAnswer> questions;
  int minReward;
  int firstReward;
  String status;
}