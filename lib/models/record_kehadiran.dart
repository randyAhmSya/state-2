import '../models/data_layer.dart';

class RecordKehadiran {
  final DateTime date;
  final List<Student> presentStudents;
  final List<Student> absentStudents;

  RecordKehadiran(
      {required this.date,
      required this.presentStudents,
      required this.absentStudents});
}
