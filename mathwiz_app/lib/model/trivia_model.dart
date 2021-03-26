import 'answer_question.dart';

class TriviaModel {
  TriviaModel({
    this.title,
    this.questions,
    this.minReward,
    this.firstReward,
    this.status,
    this.timer

  });

  String title;
  List<QuestionAnswer> questions;
  int minReward;
  int firstReward;
  String status;
  int timer;
}