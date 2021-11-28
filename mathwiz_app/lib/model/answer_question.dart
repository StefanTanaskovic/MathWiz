class QuestionAnswerModel {
  QuestionAnswerModel({
    this.id,
    this.isExpanded = false,
    this.title,
    this.question,
    this.answers,
    this.answersAmount,
    this.correctAnswer,

  });
  String title;
  int id;
  List answers;
  String question;
  bool isExpanded;
  int answersAmount;
  int correctAnswer;

    Map toJson() => {
        'answers': answers,
        'correct_answer': correctAnswer,
        'question' : question
      };
}