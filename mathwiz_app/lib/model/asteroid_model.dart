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

    Map toJson(){
    List<Map> jsonquestions =
        this.questions != null ? this.questions.map((i) => i.toJson()).toList() : null;
    return {
      'asteroid_lives': lives,
      'asteroid_published':published,
      'asteroid_reward': reward,
      'asteroid_status': status,
      'asteroid_title': title ,
      'questions':jsonquestions,
      
      
    };
  }
}