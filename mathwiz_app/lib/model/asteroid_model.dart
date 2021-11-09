import 'answer_question.dart';

class AsteroidModel {
  AsteroidModel({
    this.id,
    this.title,
    this.questions,
    this.reward,
    this.status,
    this.timer,
    this.published,
    this.lives
  });
  String id;
  bool published;
  String title;
  List<QuestionAnswerModel> questions;
  int reward;
  String status;
  int timer;
  int lives;
}