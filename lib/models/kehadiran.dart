import 'package:flutter/material.dart';

import '../models/student.dart';

import '../models/data_layer.dart';

class KehadiranProvider with ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Citra'),
    Student(name: 'Budi'),
    Student(name: 'Ali'),
    Student(name: 'Rando'),
    Student(name: 'Mamos'),
  ];

  final List<RecordKehadiran> _historyKehadiran = [];

  List<Student> get students => List.unmodifiable(_students);
  List<RecordKehadiran> get historyKehadiran =>
      List.unmodifiable(_historyKehadiran);

  void togglePresence(int index) {
    _students[index] =
        _students[index].copyWith(isPresent: !_students[index].isPresent);
    notifyListeners();
  }

  void simpanKehadiran() {
    final now = DateTime.now();
    _historyKehadiran.insert(
      0,
      RecordKehadiran(
        date: now,
        presentStudents: _students.where((s) => s.isPresent).toList(),
        absentStudents: _students.where((s) => !s.isPresent).toList(),
      ),
    );

    // Reset student presence
    for (var i = 0; i < _students.length; i++) {
      _students[i] = _students[i].copyWith(isPresent: false);
    }
    notifyListeners();
  }
}
