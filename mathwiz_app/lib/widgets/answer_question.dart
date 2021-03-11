class TrivaQuestionAnswer {
  TrivaQuestionAnswer({
    this.id,
    this.isExpanded = false,
    this.question,
    this.answers,
    this.answersAmount


  });
  int id;
  List<String> answers;
  String question;
  bool isExpanded;
  int answersAmount;
}