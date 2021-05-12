import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Lectures with ChangeNotifier {
  Map<String, LectureDetails> _lectures = {};

  Map<String, LectureDetails> get getAll {
    return {..._lectures};
  }

  int get length {
    return _lectures.length;
  }

  void addLecture(String id, String subjectId, String name, String room,
      String day, String from, String to, String type) {
    _lectures.putIfAbsent(
        id,
        () => LectureDetails(
            id: id,
            name: name,
            subjectId: subjectId,
            room: room,
            day: day,
            from: from,
            to: to,
            type: type));
    notifyListeners();
  }
}
