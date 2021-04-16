import 'answer_question.dart';

class RaceTopModel {
  RaceTopModel({
    this.id,
    this.title,
    this.questions,
    this.minReward,
    this.firstReward,
    this.status,
    this.published
  });
  String id;
  String title;
  List<QuestionAnswerModel> questions;
  int minReward;
  int firstReward;
  String status;
  bool published;
}