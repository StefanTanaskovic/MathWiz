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

  Map toJson(){
    List<Map> jsonquestions =
        this.questions != null ? this.questions.map((i) => i.toJson()).toList() : null;
    return {
      'race_first_reward': minReward,
      'race_min_reward': firstReward,
      'race_published':published,
      'race_questions':jsonquestions,
      'race_status': status,
      'race_title': title ,
    };
  }
}