class QuestionAnswer {
  QuestionAnswer({
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
  List<String> answers;
  String question;
  bool isExpanded;
  int answersAmount;
  int correctAnswer;
}