// class FavoriteManagement with ChangeNotifier {
//   Map<String, FavoriteLectureLists> _lectures = {};
//   void add(String id) {
//     _lectures.addEntries(id);
//   }
// }

import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Teachers with ChangeNotifier {
  List<User> _users = [
    User(
      id: "teacher1",
      name: "Ben Malaja",
      email: "ben.mala@gmail.com",
      role: "teacher",
      lectures: [
        LectureDetails(
          id: "lec2",
          subjectId: "CSC217",
          name: "Operating Systems",
          room: "CB2308",
          day: "Tue",
          from: "10:30",
          to: "12:00",
          type: "Hybrid",
        ),
        LectureDetails(
          id: "lec8",
          subjectId: "CSC217",
          name: "Operating Systems",
          room: "CB2306",
          day: "Fri",
          from: "12:50",
          to: "14:20",
          type: "Hybrid",
        ),
      ],
    ),
    User(
      id: "teacher2",
      name: "Noname Nolastname",
      email: "no.no@gmail.com",
      role: "teacher",
      lectures: [
        LectureDetails(
          id: "lec1",
          subjectId: "MTH102",
          name: "Mathematics II",
          room: "CB2312",
          day: "Mon",
          from: "10:30",
          to: "12:30",
          type: "Hybrid",
        ),
        LectureDetails(
          id: "lec5",
          subjectId: "MTH102",
          name: "Mathematics II",
          room: "CB2301",
          day: "Thu",
          from: "10:30",
          to: "12:30",
          type: "Hybrid",
        ),
        LectureDetails(
          id: "lec9",
          subjectId: "MTH103",
          name: "Mathematics III",
          room: "CB2306",
          day: "Thu",
          from: "14:50",
          to: "16:20",
          type: "Hybrid",
        ),
      ],
    ),
  ];

  List<User> get getAll {
    return [..._users];
  }

  User allDetails(String id) {
    for (var i = 0; i < _users.length; i++) {
      if (_users[i].id == id) {
        return _users[i];
      }
    }
  }

  int lectureLength(int index) {
    return _users[index].lectures.length;
  }

  String subjectId(int teacherIndex, int lectureIndex) {
    return _users[teacherIndex].lectures[lectureIndex].subjectId;
  }

  String subjectName(int teacherIndex, int lectureIndex) {
    return _users[teacherIndex].lectures[lectureIndex].name;
  }

  String room(int teacherIndex, int lectureIndex) {
    return _users[teacherIndex].lectures[lectureIndex].room;
  }

  int day(int teacherIndex, int lectureIndex) {
    switch (_users[teacherIndex].lectures[lectureIndex].day) {
      case "Sun":
        {
          return 0;
        }
        break;
      case "Mon":
        {
          return 1;
        }
        break;
      case "Tue":
        {
          return 2;
        }
        break;
      case "Wed":
        {
          return 3;
        }
        break;
      case "Thu":
        {
          return 4;
        }
        break;
      case "Fri":
        {
          return 5;
        }
        break;
      case "Sat":
        {
          return 6;
        }
        break;
    }
  }

  int fromHr(int teacherIndex, int lectureIndex) {
    String temp = _users[teacherIndex].lectures[lectureIndex].from;
    temp = temp.substring(0, 2);
    return int.parse(temp);
  }

  int toHr(int teacherIndex, int lectureIndex) {
    String temp = _users[teacherIndex].lectures[lectureIndex].to;
    temp = temp.substring(0, 2);
    return int.parse(temp);
  }

  int fromMn(int teacherIndex, int lectureIndex) {
    String temp = _users[teacherIndex].lectures[lectureIndex].from;
    temp = temp.substring(3, 5);
    return int.parse(temp);
  }

  int toMn(int teacherIndex, int lectureIndex) {
    String temp = _users[teacherIndex].lectures[lectureIndex].to;
    temp = temp.substring(3, 5);
    return int.parse(temp);
  }

  String type(int teacherIndex, int lectureIndex) {
    return _users[teacherIndex].lectures[lectureIndex].type;
  }

  int teacherLength() {
    return _users.length;
  }

  String id(int index) {
    return _users[index].id;
  }

  String name(int index) {
    return _users[index].name;
  }

  String lecId(int teacherIndex, int lectureIndex) {
    return _users[teacherIndex].lectures[lectureIndex].id;
  }

  // String name(int index) {
  //   return _users[index].name;
  // }

  // void addLecturer(String id, String name, String email) {
  //   _users.putIfAbsent(
  //       id,
  //       () => User(
  //             id: id,
  //             name: name,
  //             email: email,
  //             role: "teacher",
  //           ));
  //   notifyListeners();
  // }

  // void addLecture(String id, String lectureId, String subjectId, String name,
  //     String room, String day, String from, String to, String type) {
  //   _users.putIfAbsent(
  //       id,
  //       () => User(
  //             id: id,
  //             lectures: [
  //               LectureDetails(
  //                 id: lectureId,
  //                 subjectId: subjectId,
  //                 name: name,
  //                 room: room,
  //                 day: day,
  //                 from: from,
  //                 to: to,
  //                 type: type,
  //               ),
  //             ],
  //           ));
  //   // }
  //   notifyListeners();
  // }

  void addFav(User student, String lectureId) {
    // FavoriteLectureLists tempLectureId;
    // tempLectureId.lectureId = lectureId;
    // student.favoriteLectures.add(lectureId);
  }
}
