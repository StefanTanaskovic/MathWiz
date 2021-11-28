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
  List<QuestionAnswerModel> questions;
  int minReward;
  int firstReward;
  String status;
  int timer;

    Map toJson(){
    List<Map> jsonquestions =
        this.questions != null ? this.questions.map((i) => i.toJson()).toList() : null;
    return {
      'trivia_first_reward': minReward,
      'trivia_min_reward': firstReward,
      'trivia_published':published,
      'questions': jsonquestions,
      'trivia_status': status,
      'trivia_title': title ,
    };
  }
}