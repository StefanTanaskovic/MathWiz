class HomeworkModel {
  String id;
  final String ocrtext;
  final String title;
  final int gold;
  final String description;
  bool published;
  String status;

 HomeworkModel({
    this.id,
    this.published,
    this.ocrtext,
    this.title,
    this.gold,
    this.description,
    this.status,
  });
}
