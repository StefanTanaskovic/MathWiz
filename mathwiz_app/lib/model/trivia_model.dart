import 'answer_question.dart';

class TriviaModel {
  TriviaModel({
    this.id,
    this.title,
    this.questions,
    this.minReward,
    this.firstReward,
    this.status,
    this.timer,
    this.published

  });
  String id;
  bool published;
  String title;
  List<QuestionAnswer> questions;
  int minReward;
  int firstReward;
  String status;
  int timer;
}