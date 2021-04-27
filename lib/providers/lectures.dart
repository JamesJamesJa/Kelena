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
    // if (_lectures.containsKey(id)) {
    //   _lectures.update(
    //       id,
    //       (value) => LectureDetails(
    //             id: value.id,
    //             name: value.name,
    //             email: value.email,
    //             role: "teacher",
    //           ));
    // } else {
    // _lectures.addEntries(newEntries)
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
    // }
    notifyListeners();
  }

  void addFav(LectureDetails student, String lectureId) {
    // FavoriteLectureLists tempLectureId;
    // tempLectureId.lectureId = lectureId;
    // student.favoriteLectures.add(lectureId);
  }
}
