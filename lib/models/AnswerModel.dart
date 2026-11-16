class AnswerModel {
  final int? id;
  final String answer;
  final String doctor_name;
  final String? date;

  AnswerModel({
    this.id,
    required this.answer,
    required this.doctor_name,
    this.date,
  });
}
