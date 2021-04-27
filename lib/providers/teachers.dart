// class FavoriteManagement with ChangeNotifier {
//   Map<String, FavoriteLectureLists> _lectures = {};
//   void add(String id) {
//     _lectures.addEntries(id);
//   }
// }

import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Teachers with ChangeNotifier {
  Map<String, User> _users = {};

// <User> _users = [
//     User(
//       id: "teacher1",
//       name: "Ben Malaja",
//       email: "ben.mala@gmail.com",
//       role: "teacher",
//       // lectures: [
//       //   LectureDetails(
//       //     id: "lec2",
//       //     subjectId: "CSC217",
//       //     name: "Operating Systems",
//       //     room: "CB2308",
//       //     day: "Tue",
//       //     from: "10:30",
//       //     to: "12:00",
//       //     type: "Hybrid",
//       //   ),
//       //   LectureDetails(
//       //     id: "lec8",
//       //     subjectId: "CSC217",
//       //     name: "Operating Systems",
//       //     room: "CB2306",
//       //     day: "Fri",
//       //     from: "12:50",
//       //     to: "14:20",
//       //     type: "Hybrid",
//       //   ),
//       // ],
//     ),
//     User(
//       id: "teacher2",
//       name: "Noname Nolastname",
//       email: "no.no@gmail.com",
//       role: "teacher",
//       // lectures: [
//       //   LectureDetails(
//       //     id: "lec1",
//       //     subjectId: "MTH102",
//       //     name: "Mathematics II",
//       //     room: "CB2312",
//       //     day: "Mon",
//       //     from: "10:30",
//       //     to: "12:30",
//       //     type: "Hybrid",
//       //   ),
//       //   LectureDetails(
//       //     id: "lec5",
//       //     subjectId: "MTH102",
//       //     name: "Mathematics II",
//       //     room: "CB2301",
//       //     day: "Thu",
//       //     from: "10:30",
//       //     to: "12:30",
//       //     type: "Hybrid",
//       //   ),
//       //   LectureDetails(
//       //     id: "lec9",
//       //     subjectId: "MTH103",
//       //     name: "Mathematics I",
//       //     room: "CB2306",
//       //     day: "Fri",
//       //     from: "10:50",
//       //     to: "12:20",
//       //     type: "Hybrid",
//       //   ),
//       // ],
//     ),
//   ];

  Map<String, User> get getAll {
    return {..._users};
  }

  int get length {
    return _users.length;
  }

  String id(int index) {
    return _users[index].id;
  }

  String name(int index) {
    return _users[index].name;
  }

  // String name(int index) {
  //   return _users[index].name;
  // }

  void addLecturer(String id, String name, String email) {
    _users.putIfAbsent(
        id,
        () => User(
              id: id,
              name: name,
              email: email,
              role: "teacher",
            ));
    notifyListeners();
  }

  void addLecture(String id, String lectureId, String subjectId, String name,
      String room, String day, String from, String to, String type) {
    _users.putIfAbsent(
        id,
        () => User(
              id: id,
              lectures: [
                LectureDetails(
                  id: lectureId,
                  subjectId: subjectId,
                  name: name,
                  room: room,
                  day: day,
                  from: from,
                  to: to,
                  type: type,
                ),
              ],
            ));
    // }
    notifyListeners();
  }

  void addFav(User student, String lectureId) {
    // FavoriteLectureLists tempLectureId;
    // tempLectureId.lectureId = lectureId;
    // student.favoriteLectures.add(lectureId);
  }
}
