import 'package:equatable/equatable.dart';

class Absence extends Equatable {
  final int id;
  final int studentId;
  final DateTime date;

  const Absence({
    required this.id,
    required this.studentId,
    required this.date,
  });

  factory Absence.fromJson(Map<String, dynamic> json) {
    final rawDate = DateTime.parse(json['date']);
    final cleanDate = DateTime(rawDate.year, rawDate.month, rawDate.day); // Normalize
    return Absence(
      id: json['id'],
      studentId: json['student_id'],
      date: cleanDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'date': date.toIso8601String().split('T').first,
    };
  }

  @override
  List<Object?> get props => [id, studentId, date];
}
